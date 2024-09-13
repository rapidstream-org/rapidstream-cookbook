
#include "xtime_l.h"
#include "dma_driver.h"





#if defined(XPAR_UARTNS550_0_BASEADDR)
/*****************************************************************************/
/*
*
* Uart16550 setup routine, need to set baudrate to 9600 and data bits to 8
*
* @param	None
*
* @return	None
*
* @note		None.
*

******************************************************************************/
static void Uart550_Setup(void)
{
	/* Set the baudrate to be predictable
	 */
	XUartNs550_SetBaud(XPAR_UARTNS550_0_BASEADDR,
			XPAR_XUARTNS550_CLOCK_HZ, 9600);

	XUartNs550_SetLineControlReg(XPAR_UARTNS550_0_BASEADDR,
			XUN_LCR_8_DATA_BITS);

}
#endif

/*****************************************************************************/
/**
*
* This function sets up RX channel of the DMA engine to be ready for packet
* reception
*
* @param	AxiDmaInstPtr is the pointer to the instance of the DMA engine.
*
* @return	- XST_SUCCESS if the setup is successful
*		- XST_FAILURE if setup is failure
*
* @note		None.
*
******************************************************************************/
int dma_inst::RxSetup(XAxiDma * AxiDmaInstPtr)
{
	XAxiDma_BdRing *RxRingPtr;
	int Delay = 0;
	int Coalesce = 1;
	int Status;
	XAxiDma_Bd BdTemplate;
	XAxiDma_Bd *BdPtr;
	XAxiDma_Bd *BdCurPtr;
	u32 BdCount;
	u32 FreeBdCount;
	UINTPTR RxBufferPtr;
	int i;

	RxRingPtr = XAxiDma_GetRxRing(&AxiDma);

	/* Disable all RX interrupts before RxBD space setup */

	XAxiDma_BdRingIntDisable(RxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Set delay and coalescing */
	XAxiDma_BdRingSetCoalesce(RxRingPtr, Coalesce, Delay);

	/* Setup Rx BD space */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
			rx_bd_space_high - rx_bd_space_base + 1);

	Status = XAxiDma_BdRingCreate(RxRingPtr, rx_bd_space_base,
			rx_bd_space_base,
				XAXIDMA_BD_MINIMUM_ALIGNMENT, BdCount);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup an all-zero BD as the template for the Rx channel.
	 */
	XAxiDma_BdClear(&BdTemplate);

	Status = XAxiDma_BdRingClone(RxRingPtr, &BdTemplate);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Attach buffers to RxBD ring so we are ready to receive packets
	 */
	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);
	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	BdCurPtr = BdPtr;
	RxBufferPtr = rx_buffer_base;

	for (i = 0; i < FreeBdCount; i++) {

		Status = XAxiDma_BdSetBufAddr(BdCurPtr, RxBufferPtr);
		if (Status != XST_SUCCESS) {
			xil_printf("Rx set buffer addr %x on BD %x failed %d\r\n",
			(unsigned int)RxBufferPtr, (UINTPTR)BdCurPtr,
								Status);

			return XST_FAILURE;
		}

		Status = XAxiDma_BdSetLength(BdCurPtr, max_pkt_len_rx,
				RxRingPtr->MaxTransferLen);
		if (Status != XST_SUCCESS) {
			xil_printf("Rx set length %d on BD %x failed %d\r\n",
					max_pkt_len_rx, (UINTPTR)BdCurPtr, Status);

			return XST_FAILURE;
		}

		/* Receive BDs do not need to set anything for the control
		 * The hardware will set the SOF/EOF bits per stream status
		 */
		XAxiDma_BdSetCtrl(BdPtr, 0);
		XAxiDma_BdSetId(BdCurPtr, RxBufferPtr);
		RxBufferPtr += max_pkt_len_rx;

		if (i == (FreeBdCount - 1)) {
			LastRxBdPtr = BdCurPtr;
		}

		BdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(RxRingPtr, BdCurPtr);
	}

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Start RX DMA channel */
	Status = XAxiDma_BdRingStart(RxRingPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function sets up the TX channel of a DMA engine to be ready for packet
* transmission
*
* @param	AxiDmaInstPtr is the instance pointer to the DMA engine.
*
* @return	- XST_SUCCESS if the setup is successful
*		- XST_FAILURE if setup is failure
*
* @note     None.
*
******************************************************************************/
int dma_inst::TxSetup(XAxiDma * AxiDmaInstPtr)
{
	XAxiDma_BdRing *TxRingPtr;
	XAxiDma_Bd BdTemplate;
	int Delay = 0;
	int Coalesce = 1;
	int Status;
	u32 BdCount;

	TxRingPtr = XAxiDma_GetTxRing(&AxiDma);

	/* Disable all TX interrupts before Tx BD space setup */

	XAxiDma_BdRingIntDisable(TxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Set TX delay and coalesce */
	XAxiDma_BdRingSetCoalesce(TxRingPtr, Coalesce, Delay);

	/* Setup Tx BD space  */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
			tx_bd_space_high - tx_bd_space_base + 1);

	Status = XAxiDma_BdRingCreate(TxRingPtr, tx_bd_space_base,
			tx_bd_space_base,
				XAXIDMA_BD_MINIMUM_ALIGNMENT, BdCount);
	if (Status != XST_SUCCESS) {
		xil_printf("failed create BD ring in txsetup\r\n");

		return XST_FAILURE;
	}

	/*
	 * We create an all-zero BD as the template.
	 */
	XAxiDma_BdClear(&BdTemplate);

	Status = XAxiDma_BdRingClone(TxRingPtr, &BdTemplate);
	if (Status != XST_SUCCESS) {
		xil_printf("failed bdring clone in txsetup %d\r\n", Status);

		return XST_FAILURE;
	}

	/* Start the TX channel */
	Status = XAxiDma_BdRingStart(TxRingPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("failed start bdring txsetup %d\r\n", Status);

		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int dma_inst::WR2TxBuffer()
{
	u32 *TxPacket;
	int i;

	/* Create pattern in the packet to transmit
	 */
	TxPacket = Packet;

	for(i = 0; i < 32768; i++) {
		TxPacket[i]   = i+5;
	}

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxPacket, max_pkt_len *
			number_of_packets);
	#ifdef __aarch64__
	Xil_DCacheFlushRange((UINTPTR)rx_buffer_base, max_pkt_len *
			number_of_packets);
	#endif

	return XST_SUCCESS;
}

int dma_inst::SendPackets()
{
	XAxiDma_BdRing *TxRingPtr;
	int i;
	XAxiDma_Bd *BdPtr;
	int Status;
	UINTPTR BufAddr;
	XAxiDma_Bd *CurBdPtr;


	TxRingPtr = XAxiDma_GetTxRing(&AxiDma);

	/* Allocate BDs */
	Status = XAxiDma_BdRingAlloc(TxRingPtr, number_of_packets, &BdPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Set up the BDs using the information of the packet to transmit */
	BufAddr = (UINTPTR)Packet;
	CurBdPtr = BdPtr;


	for (i = 0; i < number_of_packets; i++) {
		u32 CrBits = 0;

		Status = XAxiDma_BdSetBufAddr(CurBdPtr, BufAddr);
		if (Status != XST_SUCCESS) {
			xil_printf("Tx set buffer addr %x on BD %x failed %d\r\n",
			(unsigned int)BufAddr, (UINTPTR)CurBdPtr, Status);

			return XST_FAILURE;
		}

		Status = XAxiDma_BdSetLength(CurBdPtr, max_pkt_len,
				TxRingPtr->MaxTransferLen);
		if (Status != XST_SUCCESS) {
			xil_printf("Tx set length %d on BD %x failed %d\r\n",
					max_pkt_len, (UINTPTR)CurBdPtr, Status);

			return XST_FAILURE;
		}

		if (i == 0) {
			CrBits |= XAXIDMA_BD_CTRL_TXSOF_MASK;

#if (XPAR_AXIDMA_0_SG_INCLUDE_STSCNTRL_STRM == 1)
			/* The first BD has total transfer length set in
			 * the last APP word, this is for the loopback widget
			 */
			Status = XAxiDma_BdSetAppWord(CurBdPtr,
			    XAXIDMA_LAST_APPWORD,
			    MAX_PKT_LEN * NUMBER_OF_PACKETS);

			if (Status != XST_SUCCESS) {
				xil_printf("Set app word failed with %d\r\n",
								Status);
			}
#endif
		}
		if (i == (number_of_packets - 1)) {
			CrBits |= XAXIDMA_BD_CTRL_TXEOF_MASK;
			XAxiDma_BdSetCtrl(CurBdPtr,
					XAXIDMA_BD_CTRL_TXEOF_MASK);
		}
		XAxiDma_BdSetCtrl(CurBdPtr, CrBits);

		XAxiDma_BdSetId(CurBdPtr, BufAddr);

		BufAddr += max_pkt_len;
		CurBdPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(TxRingPtr, CurBdPtr);
	}

	XTime_GetTime(&StartTotal);
	/* Give the BD to DMA to kick off the transmission. */
	Status = XAxiDma_BdRingToHw(TxRingPtr, number_of_packets, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("to hw failed %d\r\n", Status);

		return XST_FAILURE;
	}


	return XST_SUCCESS;
}

int dma_inst::CleanTxBuffer()
{
	XAxiDma_BdRing *TxRingPtr;
	u32 ProcessedBdCount = 0;
	XAxiDma_Bd *BdPtr;
	int Status;

	TxRingPtr = XAxiDma_GetTxRing(&AxiDma);

	/* Wait until the TX transactions are done */
	while (ProcessedBdCount < number_of_packets) {
		ProcessedBdCount += XAxiDma_BdRingFromHw(TxRingPtr,
					       XAXIDMA_ALL_BDS, &BdPtr);
	}

	//XTime_GetTime(&End);
	//Send_time = ((double)(End - Start) / (COUNTS_PER_SECOND / 1000000));


	/* Free all processed TX BDs for future transmission */
	Status = XAxiDma_BdRingFree(TxRingPtr, ProcessedBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//print("DMA send success!\n");

	return Status;

}

int dma_inst::RecvPackets()
{
	XAxiDma_BdRing *RxRingPtr;

	RxRingPtr = XAxiDma_GetRxRing(&AxiDma);
	ProcessedBdCount += XAxiDma_BdRingFromHw(RxRingPtr,
					   XAXIDMA_ALL_BDS, &BdPtrGlobal);
	xil_printf("Recv begin!\r\n");
}


int dma_inst::RecvWait()
{
	XAxiDma_BdRing *RxRingPtr;


	RxRingPtr = XAxiDma_GetRxRing(&AxiDma);

	//XTime_GetTime(&Start);
	//Xil_Out32(SLV_REG4, 1);
	//printf("SLV_REG4: %x\n", Xil_In32(SLV_REG4));
	/* Wait until the data has been received by the Rx channel */
	int total = 0;
	while (ProcessedBdCount < number_of_packets_rx) {

		ProcessedBdCount += XAxiDma_BdRingFromHw(RxRingPtr,
					       XAXIDMA_ALL_BDS, &BdPtrGlobal);
		if(total<10)
			printf("ProcessedBdCount=%x\n", ProcessedBdCount);
		total++;
	}

	XTime_GetTime(&EndTotal);
	//EndTotal = End;
	//Recv_time = ((double)(End - Start) / (COUNTS_PER_SECOND / 1000000));
	//Total_time = (double)(EndTotal - StartTotal);
	return XST_SUCCESS;
}



int dma_inst::CheckData(void)
{
	u32 *RxPacket;
	int i = 0;
	int j = 0;
	RxPacket = (u32 *) rx_buffer_base;

	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */
#ifndef __aarch64__
	Xil_DCacheInvalidateRange((UINTPTR)RxPacket, MAX_PKT_LEN *
								NUMBER_OF_PACKETS);
#endif

	int err_cnt = 0;
	for(i = 32767; i < 32768; i++) {
			printf("i= %d Rx = %d\n", i, RxPacket[i]);
	}
	printf("We got %d errors!\n", err_cnt);



	return XST_SUCCESS;
}




int dma_inst::CleanRxBuffer()
{
	XAxiDma_BdRing *RxRingPtr;
	u32 FreeBdCount;
	int Status;

	RxRingPtr = XAxiDma_GetRxRing(&AxiDma);

	/* Free all processed RX BDs for future transmission */
	Status = XAxiDma_BdRingFree(RxRingPtr, ProcessedBdCount, BdPtrGlobal);
	if (Status != XST_SUCCESS) {
		xil_printf("free bd failed\r\n");
		return XST_FAILURE;
	}

	/* Return processed BDs to RX channel so we are ready to receive new
	 * packets:
	 *    - Allocate all free RX BDs
	 *    - Pass the BDs to RX channel
	 */
	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);
	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtrGlobal);
	if (Status != XST_SUCCESS) {
		xil_printf("bd alloc failed\r\n");
		return XST_FAILURE;
	}

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtrGlobal);

	return Status;
}




int dma_inst::run_dma(void)
{
	int Status;

	/* Send packets */
	Status = SendPackets();
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	if (Status != XST_SUCCESS) {
		xil_printf("AXI DMA poll multi Example Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran AXI DMA poll multi Example\r\n");
	xil_printf("--- Exiting main() --- \r\n");

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

}

dma_inst::dma_inst(u32 DMA_DEV_ID_in,
		 u32 RX_BD_SPACE_HIGH_in,
		 u32 RX_BD_SPACE_BASE_in,
		 u32 MAX_PKT_LEN_in,
		 u32 MAX_PKT_LEN_RX_in,
		 u32 TX_BD_SPACE_HIGH_in,
		 u32 TX_BD_SPACE_BASE_in,
		 u32 NUMBER_OF_PACKETS_in,
		 u32 NUMBER_OF_PACKETS_RX_in,
		 u32 RX_BUFFER_BASE_in,
		 u32 TX_BUFFER_BASE_in)
{
	this->dma_dev_id = DMA_DEV_ID_in;
	this->rx_bd_space_high = RX_BD_SPACE_HIGH_in;
	this->rx_bd_space_base = RX_BD_SPACE_BASE_in;
	this->max_pkt_len = MAX_PKT_LEN_in;
	this->max_pkt_len_rx = MAX_PKT_LEN_RX_in;
	this->tx_bd_space_high = TX_BD_SPACE_HIGH_in;
	this->tx_bd_space_base = TX_BD_SPACE_BASE_in;
	this->number_of_packets = NUMBER_OF_PACKETS_in;
	this->number_of_packets_rx = NUMBER_OF_PACKETS_RX_in;
	this->rx_buffer_base = RX_BUFFER_BASE_in;
	this->Packet = (u32 *) TX_BUFFER_BASE_in;
	this->test_start_value = 0xC;
	this->ProcessedBdCount = 0;
	/*
	printf("this->dma_dev_id=%x\r\n",this->dma_dev_id);
	printf("this->rx_bd_space_high=%x\r\n",this->rx_bd_space_high);
	printf("this->rx_bd_space_base=%x\r\n",this->rx_bd_space_base);
	printf("this->max_pkt_len=%x\r\n",this->max_pkt_len);
	printf("this->tx_bd_space_high=%x\r\n",this->tx_bd_space_high);
	printf("this->tx_bd_space_base=%x\r\n",this->tx_bd_space_base);
	printf("this->number_of_packets=%x\r\n",this->number_of_packets);
	printf("this->rx_buffer_base=%x\r\n",this->rx_buffer_base);
	printf("this->Packet=%x\r\n",this->Packet);
	*/
}

int dma_inst::dma_init()
{

	int Status;
	XAxiDma_Config *Config;

#if defined(XPAR_UARTNS550_0_BASEADDR)

	Uart550_Setup();

#endif

	xil_printf("\r\n--- Entering main() --- \r\n");
#ifdef __aarch64__
	Xil_SetTlbAttributes(tx_bd_space_base, NORM_NONCACHE);
	Xil_SetTlbAttributes(rx_bd_space_base, NORM_NONCACHE);
#endif

	Config = XAxiDma_LookupConfig(dma_dev_id);
	if (!Config) {
		xil_printf("No config found for %d\r\n", dma_dev_id);
		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiDma_CfgInitialize(&AxiDma, Config);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(!XAxiDma_HasSg(&AxiDma)) {
		xil_printf("Device configured as simple mode \r\n");
		return XST_FAILURE;
	}

	Status = TxSetup(&AxiDma);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = RxSetup(&AxiDma);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return Status;
}


int dma_inst::print_results()
{
	//printf("DMA Send Time: %.2lfus\n", Send_time);
	//printf("DMA Send Throughput: %.2lfMB/s\n", (float)max_pkt_len*number_of_packets/Send_time);
	//printf("DMA Recv Time: %.2lfus\n", Recv_time);
	//printf("DMA Recv Throughput: %.2lfMB/s\n", (float)max_pkt_len*number_of_packets/Recv_time);
	Total_time = ((double)(EndTotal - StartTotal) / (COUNTS_PER_SECOND / 1000000));
	double Tpt_tx = max_pkt_len*number_of_packets/Total_time;
	double Tpt_rx = max_pkt_len_rx*number_of_packets_rx/Total_time;
	printf("Overall Time: %.2lf us\n", Total_time);
	printf("Tx throughput: %.2lf MB/s\n", Tpt_tx);
	printf("Rx throughput: %.2lf MB/s\n", Tpt_rx);
	return XST_SUCCESS;
}
