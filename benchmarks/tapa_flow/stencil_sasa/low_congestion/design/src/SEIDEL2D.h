#ifndef SEIDEL2D_H
#define SEIDEL2D_H

#define GRID_ROWS 60
// #define GRID_ROWS 9720
#define GRID_COLS 1024

#define KERNEL_COUNT 12
#define PART_ROWS GRID_ROWS / KERNEL_COUNT

#define ITERATION 128

#include <ap_int.h>
#include <inttypes.h>
#define DWIDTH 512
#define INTERFACE_WIDTH ap_uint<DWIDTH>
	const int WIDTH_FACTOR = DWIDTH/32;
#define PARA_FACTOR 16

#define STAGE_COUNT 1
#define TOP_APPEND 65
#define BOTTOM_APPEND 66
// #define OVERLAP_TOP_OVERHEAD 8255
// #define OVERLAP_BOTTOM_OVERHEAD 8382
#define OVERLAP_TOP_OVERHEAD 2048
#define OVERLAP_BOTTOM_OVERHEAD 2048

#define DECRE_TOP_APPEND 65
#define DECRE_BOTTOM_APPEND 66

#define MIDLE_REGION (GRID_COLS*PART_ROWS + 131*WIDTH_FACTOR + (TOP_APPEND+BOTTOM_APPEND)*WIDTH_FACTOR*(STAGE_COUNT-1) + (OVERLAP_TOP_OVERHEAD + OVERLAP_BOTTOM_OVERHEAD))/WIDTH_FACTOR
#endif