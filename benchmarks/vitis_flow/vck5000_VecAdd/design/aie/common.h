// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#pragma once
#include <cstdint>
#include <cstddef>

//Definitions that are needed by both the AIE and host sources

//S0 control packet, 16 word (64 bytes) total
struct overlay_S0_control
{
	//Parameters
	uint32_t VEC_NUM;  // The number of vectors of the inputs
	uint32_t VEC_LEN;  // The vector length of the inputs
	uint32_t RSVD[14]; // reserved words to fill up the 64 byte packets
};
