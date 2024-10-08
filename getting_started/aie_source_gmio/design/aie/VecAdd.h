#pragma once
#include <adf.h>
#include "common.h"
#include "add_kernel.h"
#include "read_mem.h"
#include "write_mem.h"

using namespace adf;

class VecAdd: public adf::graph
{
private:
	kernel k_vadd;
	kernel k_read_mem1;
  kernel k_read_mem2;
	kernel k_write_mem;

public:
  input_gmio  m_s0;
  input_gmio  m_s1;
  output_gmio m_s2;

  VecAdd()
  {
    // create kernel
    k_read_mem1                 = kernel::create(read_mem);
    source(k_read_mem1)         = "read_mem.cpp";
    headers(k_read_mem1)        = {"read_mem.h","common.h"};
    runtime<ratio>(k_read_mem1) = OCCUPANCY;

    k_read_mem2                 = kernel::create(read_mem);
    source(k_read_mem2)         = "read_mem.cpp";
    headers(k_read_mem2)        = {"read_mem.h","common.h"};
    runtime<ratio>(k_read_mem2) = OCCUPANCY;

    k_vadd                      = kernel::create(add_kernel);
    source(k_vadd)              = "add_kernel.cpp";
    headers(k_vadd)             = {"add_kernel.h","common.h"};
    runtime<ratio>(k_vadd)      = OCCUPANCY;

    k_write_mem                 = kernel::create(write_mem);
    source(k_write_mem)         = "write_mem.cpp";
    headers(k_write_mem)        = {"write_mem.h","common.h"};
    runtime<ratio>(k_write_mem) = OCCUPANCY;


    location<kernel>(k_read_mem1) = tile(5, 1);
    location<kernel>(k_read_mem2) = tile(4, 1);
    location<kernel>(k_vadd)      = tile(5, 2);
    location<kernel>(k_write_mem) = tile(4, 2);

    m_s0 = input_gmio::create("m_s0", 64, 1000);
    m_s1 = input_gmio::create("m_s1", 64, 1000);
    m_s2 = output_gmio::create("m_s2", 64, 1000);

		connect<window<DATA_SIZE>>(m_s0.out[0], k_read_mem1.in[0]);
		connect<window<DATA_SIZE>>(m_s1.out[0], k_read_mem2.in[0]);
		connect<stream> (k_read_mem1.out[0], k_vadd.in[0]);
    connect<stream> (k_read_mem2.out[0], k_vadd.in[1]);
    connect<stream> (k_vadd.out[0], k_write_mem.in[0]);
		connect<window<DATA_SIZE>>(k_write_mem.out[0], m_s2.in[0]);
}; };
