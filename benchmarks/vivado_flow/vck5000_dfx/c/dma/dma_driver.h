// Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
// The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

#include "xaxidma.h"
#include "xparameters.h"
#include "xdebug.h"
#include "xtime_l.h"
#include "stdio.h"
#include "sleep.h"
#ifdef __aarch64__
#include "xil_mmu.h"
#endif

//width of a packet is 49 bits
//bft2arm_packet = {1'b1, SLV_REG1[15:0], SLV_REG0[31:0]}
//arm2bft_packet = {SLV_REG5[16:0], SLV_REG4[31:0]}
//input fifo empty = SLV_REG3[1]
//output fifo full = SLV_REG3[0]
//input fifo rd_en = SLV_REG7[1]
#if defined(XPAR_UARTNS550_0_BASEADDR)
#include "xuartns550_l.h"       /* to use uartns550 */
#endif

#ifndef DEBUG
extern void xil_printf(const char *format, ...);
#endif



void read_from_fifo(int * ctrl_reg);

void write_to_fifo(int high_32_bits, int low_32_bits, int * ctrl_reg);

void init_regs();

int stream_op(int op_type, int i);

int run_dma(void);


class dma_inst{

public:
	XTime Start, End;
	XTime StartTotal, EndTotal;
	double Send_time;
	double Recv_time;
	double Total_time;
	XAxiDma AxiDma;
	u32 *Packet;
	XAxiDma_Bd *LastRxBdPtr = NULL;
	dma_inst(u32 DMA_DEV_ID_in,
			 u32 RX_BD_SPACE_HIGH_in,
			 u32 RX_BD_SPACE_BASE_in,
			 u32 MAX_PKT_LEN_in,
			 u32 MAX_PKT_LEN_RX_in,
			 u32 TX_BD_SPACE_HIGH_in,
			 u32 TX_BD_SPACE_BASE_in,
			 u32 NUMBER_OF_PACKETS_in,
			 u32 NUMBER_OF_PACKETS_RX_in,
			 u32 RX_BUFFER_BASE_in,
			 u32 TX_BUFFER_BASE_in);
	u32 dma_dev_id;
	u32 rx_bd_space_high;
	u32 rx_bd_space_base;
	u32 max_pkt_len;
	u32 max_pkt_len_rx;
	u32 tx_bd_space_high;
	u32 tx_bd_space_base;
	u32 number_of_packets;
	u32 number_of_packets_rx;
	u32 test_start_value;
	u32 rx_buffer_base;
	XAxiDma_Bd *BdPtrGlobal;
	u32 ProcessedBdCount;

	int RxSetup(XAxiDma * AxiDmaInstPtr);
	int TxSetup(XAxiDma * AxiDmaInstPtr);

	int dma_init();
	int WR2TxBuffer();
	int SendPackets();
	int CleanTxBuffer();
	int RecvPackets();
	int RecvWait();
	int CheckData();
	int CleanRxBuffer();
	int run_dma(void);
	int print_results();


private:





};
