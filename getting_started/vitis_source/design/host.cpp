// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1

#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <CL/cl2.hpp>
#include "VecAdd.h"

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
    size_t size_in_bytes = DATA_SIZE * sizeof(int);

    std::vector<cl::Device> devices;
    cl_int err;
    cl::Context context;
    cl::CommandQueue q;
    cl::Kernel vecadd;
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
            CHECK_MSG(err, vecadd = cl::Kernel(program, "VecAdd", &err));
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
    CHECK_MSG(err, cl::Buffer buffer_in1(context, CL_MEM_READ_ONLY, size_in_bytes, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_in2(context, CL_MEM_READ_ONLY, size_in_bytes, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_out(context, CL_MEM_WRITE_ONLY, size_in_bytes, NULL, &err));

    // set the kernel Arguments
    int arg_num = 0;
    CHECK_MSG(err, err = vecadd.setArg(arg_num++, buffer_in1));
    CHECK_MSG(err, err = vecadd.setArg(arg_num++, buffer_in2));
    CHECK_MSG(err, err = vecadd.setArg(arg_num++, buffer_out));

    // We then need to map our OpenCL buffers to get the pointers
    int* ptr_in1;
    int* ptr_in2;
    int* ptr_out;
    CHECK_MSG(err,
              ptr_in1 = (int*)q.enqueueMapBuffer(buffer_in1, CL_TRUE, CL_MAP_WRITE, 0, size_in_bytes, NULL, NULL, &err));
    CHECK_MSG(err,
              ptr_in2 = (int*)q.enqueueMapBuffer(buffer_in2, CL_TRUE, CL_MAP_WRITE, 0, size_in_bytes, NULL, NULL, &err));
    CHECK_MSG(err, ptr_out = (int*)q.enqueueMapBuffer(buffer_out, CL_TRUE, CL_MAP_READ, 0, size_in_bytes, NULL,
                                                         NULL, &err));

    // Initialize input data
    for (int i = 0; i < DATA_SIZE; i++) {
        ptr_in1[i] = rand() % DATA_SIZE;
        ptr_in2[i] = rand() % DATA_SIZE;
    }

    // Data will be migrated to device global memory
    CHECK_MSG(err, err = q.enqueueMigrateMemObjects({buffer_in1, buffer_in2}, 0 /* 0 means from host*/));

    // Launnch the VecAdd kernel
    CHECK_MSG(err, err = q.enqueueTask(vecadd));

    // Migrate the result data back to host memory
    CHECK_MSG(err, q.enqueueMigrateMemObjects({buffer_out}, CL_MIGRATE_MEM_OBJECT_HOST));

    // Wait for all the commands to complete
    CHECK_MSG(err, q.finish());

    // Verify the result
    int match = 0;
    for (int i = 0; i < DATA_SIZE; i++) {
        int host_result = ptr_in1[i] + ptr_in2[i];
        if (ptr_out[i] == host_result) {
            match = 0;
        } else {
            std::cout << "Error: Result mismatch:\n"
                      << "i = " << i << " CPU result = " << host_result << " Device result = " << ptr_out[i] << std::endl;
            match = 1;
            break;
        }
    }

    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_in1, ptr_in1));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_in2, ptr_in2));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_out, ptr_out));
    CHECK_MSG(err, err = q.finish());

    std::cout << "TEST " << (match == 1 ? "FAILED!" : "PASSED!") << std::endl;
    return (match ? EXIT_FAILURE : EXIT_SUCCESS);
}
