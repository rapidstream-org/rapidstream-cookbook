// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1

#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <CL/cl2.hpp>
#include "bandwidth23.h"

void print_512(bit512 din){
    // Print out the data 64-bit hex per line
    for (int i = 0; i < 8; i++) {
        printf("%08x%08x\n", (unsigned int) din(63+i*64, 32+i*64), (unsigned int) din(31+i*64, 0+i*64));
    }
}

#define CHECK_MSG(msg, call)                                                                   \
    call;                                                                                        \
    if (msg != CL_SUCCESS) {                                                                   \
        printf("%s:%d Error calling " #call ", error code is: %d\n", __FILE__, __LINE__, msg); \
        exit(EXIT_FAILURE);                                                                      \
    }

static const std::string error_message =
    "Error: Result mismatch:\n"
    "i = %d CPU result = %d Device result = %d\n";

int main(int argc, char* argv[]) {
    // Must specify the xclbin file as the second argument
    if (argc != 2) {
        std::cout << "Please run the application by: " << argv[0] << " <xclbin>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string xclbin_file = argv[1];

    // Calculate the byte size the input data
    long DATA_SIZE = 4096;

    std::vector<cl::Device> devices;
    cl_int err;
    cl::Context context;
    cl::CommandQueue q;
    cl::Kernel bandwidth23;
    cl::Program program;
    std::vector<cl::Platform> platforms;
    bool device_found = false;

    // The get_xil_devices will return vector of Xilinx Devices
    // Iterate through devices and find Xilinx Alveo Device
    cl::Platform::get(&platforms);
    for (size_t i = 0; (i < platforms.size()) & (device_found == false); i++) {
        cl::Platform platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>();
        if (platformName == "Xilinx") {
            devices.clear();
            platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
            if (devices.size()) {
                device_found = true;
                break;
            }
        }
    }
    if (device_found == false) {
        std::cout << "Error: could not find the target Xilinx Alveo device" << std::endl;
        return EXIT_FAILURE;
    }

    std::cout << "INFO: reading " << xclbin_file << " xclbinfile" << std::endl;
    FILE* fp;
    if ((fp = fopen(xclbin_file.c_str(), "r")) == nullptr) {
        std::cout << "ERROR: cannot open" << xclbin_file.c_str() << " xclbin!" << std::endl;
        exit(EXIT_FAILURE);
    }

    // Load xclbin
    std::cout << "INFO: loading: '" << xclbin_file << "'\n";
    std::ifstream bin_file(xclbin_file, std::ifstream::binary);
    bin_file.seekg(0, bin_file.end);
    unsigned nb = bin_file.tellg();
    bin_file.seekg(0, bin_file.beg);
    char* buf = new char[nb];
    bin_file.read(buf, nb);

    // Creating Program from Binary File
    cl::Program::Binaries bins;
    bins.push_back({buf, nb});
    bool valid_device = false;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // For the device, we create a context and command queue
        CHECK_MSG(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
        CHECK_MSG(err, q = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));
        std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Device[" << i << "]: failed to load xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: xclbin is loaded successfully!\n";
            CHECK_MSG(err, bandwidth23 = cl::Kernel(program, "bandwidth23", &err));
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }

    // These commands will allocate memory on the Device. The cl::Buffer objects can
    // be used to reference the memory locations on the device.
    CHECK_MSG(err, cl::Buffer buffer_ch_0(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_1(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_2(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_3(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_4(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_5(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_6(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_7(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_8(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_9(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_10(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_11(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_12(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_13(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_14(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_15(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_16(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_17(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_18(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_19(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_20(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_21(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_ch_22(context, CL_MEM_READ_WRITE, sizeof(data_t)*DATA_SIZE, NULL, &err));


    // set the kernel Arguments
    CHECK_MSG(err, err = bandwidth23.setArg(0, buffer_ch_0));
    CHECK_MSG(err, err = bandwidth23.setArg(1, buffer_ch_1));
    CHECK_MSG(err, err = bandwidth23.setArg(2, buffer_ch_2));
    CHECK_MSG(err, err = bandwidth23.setArg(3, buffer_ch_3));
    CHECK_MSG(err, err = bandwidth23.setArg(4, buffer_ch_4));
    CHECK_MSG(err, err = bandwidth23.setArg(5, buffer_ch_5));
    CHECK_MSG(err, err = bandwidth23.setArg(6, buffer_ch_6));
    CHECK_MSG(err, err = bandwidth23.setArg(7, buffer_ch_7));
    CHECK_MSG(err, err = bandwidth23.setArg(8, buffer_ch_8));
    CHECK_MSG(err, err = bandwidth23.setArg(9, buffer_ch_9));
    CHECK_MSG(err, err = bandwidth23.setArg(10, buffer_ch_10));
    CHECK_MSG(err, err = bandwidth23.setArg(11, buffer_ch_11));
    CHECK_MSG(err, err = bandwidth23.setArg(12, buffer_ch_12));
    CHECK_MSG(err, err = bandwidth23.setArg(13, buffer_ch_13));
    CHECK_MSG(err, err = bandwidth23.setArg(14, buffer_ch_14));
    CHECK_MSG(err, err = bandwidth23.setArg(15, buffer_ch_15));
    CHECK_MSG(err, err = bandwidth23.setArg(16, buffer_ch_16));
    CHECK_MSG(err, err = bandwidth23.setArg(17, buffer_ch_17));
    CHECK_MSG(err, err = bandwidth23.setArg(18, buffer_ch_18));
    CHECK_MSG(err, err = bandwidth23.setArg(19, buffer_ch_19));
    CHECK_MSG(err, err = bandwidth23.setArg(20, buffer_ch_20));
    CHECK_MSG(err, err = bandwidth23.setArg(21, buffer_ch_21));
    CHECK_MSG(err, err = bandwidth23.setArg(22, buffer_ch_22));


    // We then need to map our OpenCL buffers to get the pointers
    data_t* ch_0;
    data_t* ch_1;
    data_t* ch_2;
    data_t* ch_3;
    data_t* ch_4;
    data_t* ch_5;
    data_t* ch_6;
    data_t* ch_7;
    data_t* ch_8;
    data_t* ch_9;
    data_t* ch_10;
    data_t* ch_11;
    data_t* ch_12;
    data_t* ch_13;
    data_t* ch_14;
    data_t* ch_15;
    data_t* ch_16;
    data_t* ch_17;
    data_t* ch_18;
    data_t* ch_19;
    data_t* ch_20;
    data_t* ch_21;
    data_t* ch_22;

    CHECK_MSG(err, ch_0 = (data_t*)q.enqueueMapBuffer(buffer_ch_0, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_1 = (data_t*)q.enqueueMapBuffer(buffer_ch_1, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_2 = (data_t*)q.enqueueMapBuffer(buffer_ch_2, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_3 = (data_t*)q.enqueueMapBuffer(buffer_ch_3, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_4 = (data_t*)q.enqueueMapBuffer(buffer_ch_4, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_5 = (data_t*)q.enqueueMapBuffer(buffer_ch_5, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_6 = (data_t*)q.enqueueMapBuffer(buffer_ch_6, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_7 = (data_t*)q.enqueueMapBuffer(buffer_ch_7, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_8 = (data_t*)q.enqueueMapBuffer(buffer_ch_8, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_9 = (data_t*)q.enqueueMapBuffer(buffer_ch_9, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_10 = (data_t*)q.enqueueMapBuffer(buffer_ch_10, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_11 = (data_t*)q.enqueueMapBuffer(buffer_ch_11, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_12 = (data_t*)q.enqueueMapBuffer(buffer_ch_12, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_13 = (data_t*)q.enqueueMapBuffer(buffer_ch_13, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_14 = (data_t*)q.enqueueMapBuffer(buffer_ch_14, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_15 = (data_t*)q.enqueueMapBuffer(buffer_ch_15, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_16 = (data_t*)q.enqueueMapBuffer(buffer_ch_16, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_17 = (data_t*)q.enqueueMapBuffer(buffer_ch_17, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_18 = (data_t*)q.enqueueMapBuffer(buffer_ch_18, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_19 = (data_t*)q.enqueueMapBuffer(buffer_ch_19, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_20 = (data_t*)q.enqueueMapBuffer(buffer_ch_20, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_21 = (data_t*)q.enqueueMapBuffer(buffer_ch_21, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, ch_22 = (data_t*)q.enqueueMapBuffer(buffer_ch_22, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(data_t)*DATA_SIZE, NULL, NULL, &err));


    // Initialize input data
    for (int i = 0; i < DATA_SIZE; i++) { ch_0[i] = 0 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_1[i] = 1 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_2[i] = 2 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_3[i] = 3 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_4[i] = 4 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_5[i] = 5 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_6[i] = 6 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_7[i] = 7 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_8[i] = 8 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_9[i] = 9 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_10[i] = 10 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_11[i] = 11 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_12[i] = 12 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_13[i] = 13 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_14[i] = 14 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_15[i] = 15 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_16[i] = 16 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_17[i] = 17 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_18[i] = 18 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_19[i] = 19 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_20[i] = 20 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_21[i] = 21 ^ i; }
    for (int i = 0; i < DATA_SIZE; i++) { ch_22[i] = 22 ^ i; }

    CHECK_MSG(err, err = bandwidth23.setArg(0, buffer_ch_0));
    CHECK_MSG(err, err = bandwidth23.setArg(1, buffer_ch_1));
    CHECK_MSG(err, err = bandwidth23.setArg(2, buffer_ch_2));
    CHECK_MSG(err, err = bandwidth23.setArg(3, buffer_ch_3));
    CHECK_MSG(err, err = bandwidth23.setArg(4, buffer_ch_4));
    CHECK_MSG(err, err = bandwidth23.setArg(5, buffer_ch_5));
    CHECK_MSG(err, err = bandwidth23.setArg(6, buffer_ch_6));
    CHECK_MSG(err, err = bandwidth23.setArg(7, buffer_ch_7));
    CHECK_MSG(err, err = bandwidth23.setArg(8, buffer_ch_8));
    CHECK_MSG(err, err = bandwidth23.setArg(9, buffer_ch_9));
    CHECK_MSG(err, err = bandwidth23.setArg(10, buffer_ch_10));
    CHECK_MSG(err, err = bandwidth23.setArg(11, buffer_ch_11));
    CHECK_MSG(err, err = bandwidth23.setArg(12, buffer_ch_12));
    CHECK_MSG(err, err = bandwidth23.setArg(13, buffer_ch_13));
    CHECK_MSG(err, err = bandwidth23.setArg(14, buffer_ch_14));
    CHECK_MSG(err, err = bandwidth23.setArg(15, buffer_ch_15));
    CHECK_MSG(err, err = bandwidth23.setArg(16, buffer_ch_16));
    CHECK_MSG(err, err = bandwidth23.setArg(17, buffer_ch_17));
    CHECK_MSG(err, err = bandwidth23.setArg(18, buffer_ch_18));
    CHECK_MSG(err, err = bandwidth23.setArg(19, buffer_ch_19));
    CHECK_MSG(err, err = bandwidth23.setArg(20, buffer_ch_20));
    CHECK_MSG(err, err = bandwidth23.setArg(21, buffer_ch_21));
    CHECK_MSG(err, err = bandwidth23.setArg(22, buffer_ch_22));
    CHECK_MSG(err, err = bandwidth23.setArg(23, DATA_SIZE));


    // Data will be migrated to device global memory
    CHECK_MSG(err, err = q.enqueueMigrateMemObjects({buffer_ch_0, buffer_ch_1, buffer_ch_2, buffer_ch_3, buffer_ch_4, buffer_ch_5, buffer_ch_6, buffer_ch_7, buffer_ch_8, buffer_ch_9, buffer_ch_10, buffer_ch_11, buffer_ch_12, buffer_ch_13, buffer_ch_14, buffer_ch_15, buffer_ch_16, buffer_ch_17, buffer_ch_18, buffer_ch_19, buffer_ch_20, buffer_ch_21, buffer_ch_22}, 0 /* 0 means from host*/));

    // Launnch the VecAdd kernel
    CHECK_MSG(err, err = q.enqueueTask(bandwidth23));

    // Migrate the result data back to host memory
    CHECK_MSG(err, q.enqueueMigrateMemObjects({buffer_ch_0, buffer_ch_1, buffer_ch_2, buffer_ch_3, buffer_ch_4, buffer_ch_5, buffer_ch_6, buffer_ch_7, buffer_ch_8, buffer_ch_9, buffer_ch_10, buffer_ch_11, buffer_ch_12, buffer_ch_13, buffer_ch_14, buffer_ch_15, buffer_ch_16, buffer_ch_17, buffer_ch_18, buffer_ch_19, buffer_ch_20, buffer_ch_21, buffer_ch_22}, CL_MIGRATE_MEM_OBJECT_HOST));

    // Wait for all the commands to complete
    CHECK_MSG(err, q.finish());

    // Verify the result
    int match = 0;
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_0[i] != ((0 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_1[i] != ((1 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_2[i] != ((2 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_3[i] != ((3 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_4[i] != ((4 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_5[i] != ((5 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_6[i] != ((6 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_7[i] != ((7 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_8[i] != ((8 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_9[i] != ((9 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_10[i] != ((10 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_11[i] != ((11 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_12[i] != ((12 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_13[i] != ((13 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_14[i] != ((14 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_15[i] != ((15 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_16[i] != ((16 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_17[i] != ((17 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_18[i] != ((18 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_19[i] != ((19 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_20[i] != ((20 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_21[i] != ((21 ^ i))<<1) match++; }
    for (int i = 0; i < DATA_SIZE; i++) { if(ch_22[i] != ((22 ^ i))<<1) match++; }


    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_0, ch_0));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_1, ch_1));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_2, ch_2));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_3, ch_3));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_5, ch_5));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_6, ch_6));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_7, ch_7));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_8, ch_8));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_9, ch_9));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_10, ch_10));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_11, ch_11));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_12, ch_12));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_13, ch_13));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_14, ch_14));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_15, ch_15));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_16, ch_16));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_17, ch_17));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_18, ch_18));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_19, ch_19));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_20, ch_20));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_21, ch_21));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_ch_22, ch_22));

    CHECK_MSG(err, err = q.finish());

    if (match == 0) {
        std::cout << "TEST PASSED!" << std::endl;
    } else {
        std::cout << match << " TEST FAILED!" << std::endl;
    }
    return (match ? EXIT_FAILURE : EXIT_SUCCESS);
}
