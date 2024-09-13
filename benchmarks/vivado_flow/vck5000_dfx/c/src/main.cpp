#include "stdio.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_mmu.h"


#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR       0x01000000
#else
#define MEM_BASE_ADDR      (DDR_BASE_ADDR + 0x1000000)
#endif


// 8 MB for tx ring buffer
#define TX_BD_SPACE_BASE	(MEM_BASE_ADDR)
#define TX_BD_SPACE_HIGH	(MEM_BASE_ADDR + 0x007FFFFF)

// 8 MB for rx ring buffer
#define RX_BD_SPACE_BASE	(MEM_BASE_ADDR + 0x00800000)
#define RX_BD_SPACE_HIGH	(MEM_BASE_ADDR + 0x00FFFFFF)

// 240 MB for tx_buffer
#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x01000000)
#define TX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x0EFFFFFF)

// 240 MB for RX buffer
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x10000000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x1EFFFFFF)

#define KL_BASE     XPAR_VADD_BW_0_BASEADDR

#define RD_BASE_LOW  (KL_BASE + 0x00000010)
#define RD_BASE_HIGH (KL_BASE + 0x00000014)
#define WR_BASE_LOW  (KL_BASE + 0x0000001C)
#define WR_BASE_HIGH (KL_BASE + 0x00000020)
#define AXIL_N_LOW   (KL_BASE + 0x00000028)
#define AXIL_N_HIGH  (KL_BASE + 0x0000002C)

int main(){
	printf("Hello world\n");
	printf("%08x\n", MEM_BASE_ADDR);

	#ifdef __aarch64__
		Xil_SetTlbAttributes(TX_BUFFER_BASE, NORM_NONCACHE);
		Xil_SetTlbAttributes(RX_BUFFER_BASE, NORM_NONCACHE);
	#endif

	u32 *TxPacket = (u32 *) TX_BUFFER_BASE;
	u32 *RxPacket = (u32 *) RX_BUFFER_BASE;

	for(int i=0; i<4096; i++){
		TxPacket[i] = i;
		RxPacket[i] = 0;
	}
	Xil_Out32(RD_BASE_LOW,  TX_BUFFER_BASE);
	Xil_Out32(RD_BASE_HIGH, 0);

	Xil_Out32(WR_BASE_LOW,  RX_BUFFER_BASE);
	Xil_Out32(WR_BASE_HIGH, 0);

	Xil_Out32(AXIL_N_LOW, 16);
	Xil_Out32(AXIL_N_HIGH, 0);

	Xil_Out32(KL_BASE, 1);
	for(int i=0; i<10; i++){
		printf("REG0: %08x\n", Xil_In32(KL_BASE));
	}
	printf("\n\n\n");
	for(int i=0; i<128; i++){
		printf("TX[%d]:%08x, RX[%d]: %08x\n", i, TxPacket[i]<<1, i, RxPacket[i]);
	}

	return 0;
}
