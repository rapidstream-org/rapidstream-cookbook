// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include <iostream>
#include <cstdlib>
#include <unistd.h>
#include <sys/stat.h>
#include <string>
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_uuid.h"

// Kernel arguments index definition
#define krnl_input_mover_size1      0
#define krnl_input_mover_size2      1
#define krnl_input_mover_size3      2
#define krnl_input_mover_ptr1       3
#define krnl_input_mover_ptr2       4
#define krnl_input_mover_ptr3       5

#define krnl_output_mover_size      0
#define krnl_output_mover_ptr       1

#define DEVICE_ID   0
#define DATA_SIZE   16

// print command line help
void print_help(void) {
    std::cout << std::endl << "    Usage: host_everlay.exe -i JPEGFILE [-c COLOR]" << std::endl << std::endl;
}


// Main program body
int main(int argc, char *argv[]) {
struct timeval start, end;

	int buffer_size_in_bytes = DATA_SIZE * sizeof(int);

    std::string binaryFile;
    if (argc < 2){
        std::cout << argc << std::endl;
        print_help();
    }else{
        binaryFile = argv[argc-1];
    }


    auto device = xrt::device(DEVICE_ID);
	std::cout << "device name: " << device.get_info<xrt::info::device::name>() << "\n";
    std::cout << "device bdf:  " << device.get_info<xrt::info::device::bdf>() << "\n";


    // Load xclbin
    std::cout << "Load " << binaryFile << std::endl;
    xrt::uuid xclbin_uuid = device.load_xclbin(binaryFile);

    // create kernel objects
    std::cout << "Create kernels" << std::endl;
    xrt::kernel krnl_input_mover  = xrt::kernel(device, xclbin_uuid, "krnl_input_mover");
    xrt::kernel krnl_output_mover = xrt::kernel(device, xclbin_uuid, "krnl_output_mover");

	auto bank_grp_in_buf1 = krnl_input_mover.group_id(krnl_input_mover_ptr1);
    auto bank_grp_in_buf2 = krnl_input_mover.group_id(krnl_input_mover_ptr2);
    auto bank_grp_in_buf3 = krnl_input_mover.group_id(krnl_input_mover_ptr3);
    auto bank_grp_out_buf = krnl_output_mover.group_id(krnl_output_mover_ptr);

    auto input_buffer1 = xrt::bo(device,                   64, bank_grp_in_buf1);
	auto input_buffer2 = xrt::bo(device, buffer_size_in_bytes, bank_grp_in_buf2);
    auto input_buffer3 = xrt::bo(device, buffer_size_in_bytes, bank_grp_in_buf3);
    auto output_buffer = xrt::bo(device, buffer_size_in_bytes, bank_grp_out_buf);


	auto input_buffer1_mapped = input_buffer1.map<int*>();
	auto input_buffer2_mapped = input_buffer2.map<int*>();
	auto input_buffer3_mapped = input_buffer3.map<int*>();
    auto output_buffer_mapped = output_buffer.map<int*>();

    input_buffer1_mapped[0] = 1;
    input_buffer1_mapped[1] = DATA_SIZE;

    for (auto i=2;        i<16; ++i) { input_buffer1_mapped[i] = 0; }
    for (auto i=0; i<DATA_SIZE; ++i) { input_buffer2_mapped[i] = i; }
	for (auto i=0; i<DATA_SIZE; ++i) { input_buffer3_mapped[i] = i; }
    for (auto i=0; i<DATA_SIZE; ++i) { output_buffer_mapped[i] = 0; }

    input_buffer1.sync(XCL_BO_SYNC_BO_TO_DEVICE);
	input_buffer2.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    input_buffer3.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    auto run_input  =  krnl_input_mover(16, DATA_SIZE, DATA_SIZE, input_buffer1, input_buffer2, input_buffer3);
    auto run_output = krnl_output_mover(DATA_SIZE, output_buffer);
    run_input.wait();
    std::cout << "krnl_input_mover has been executed!" << std::endl;
    run_output.wait();
    std::cout << "krnl_output_mover has been executed!" << std::endl;

    output_buffer.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

	int err_cnt = 0;
	for (auto i=0; i<DATA_SIZE; ++i) {
		if(output_buffer_mapped[i] != i*2){
			std::cout << i << ": " << output_buffer_mapped[i] << std::endl;
			err_cnt++;
		}
	}

    if (err_cnt){
        std::cout << "Test Failed with " << err_cnt << " errors!" << std::endl;
    }else{
        std::cout << "Test Passed!" << std::endl;
    }

    return 0;
}
