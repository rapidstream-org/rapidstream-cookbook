// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1

#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <CL/cl2.hpp>
#include "kernel3.h"

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
    size_t A_SIZE = I * K * sizeof(data_t);
    size_t B_SIZE = J * K * sizeof(data_t);
    size_t C_SIZE = I * J * sizeof(data_t);

    std::vector<cl::Device> devices;
    cl_int err;
    cl::Context context;
    cl::CommandQueue q;
    cl::Kernel kernel3;
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
            CHECK_MSG(err, kernel3 = cl::Kernel(program, "kernel3", &err));
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
    CHECK_MSG(err, cl::Buffer buffer_a(context, CL_MEM_READ_ONLY, A_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_b(context, CL_MEM_READ_ONLY, B_SIZE, NULL, &err));
    CHECK_MSG(err, cl::Buffer buffer_result(context, CL_MEM_WRITE_ONLY, C_SIZE, NULL, &err));

    // set the kernel Arguments
    int arg_num = 0;
    CHECK_MSG(err, err = kernel3.setArg(arg_num++, buffer_a));
    CHECK_MSG(err, err = kernel3.setArg(arg_num++, buffer_b));
    CHECK_MSG(err, err = kernel3.setArg(arg_num++, buffer_result));


    // We then need to map our OpenCL buffers to get the pointers
    data_t* A;
    data_t* B;
    data_t* C;
    data_t C_golden[I*J];
    CHECK_MSG(err, A = (data_t*)q.enqueueMapBuffer(buffer_a, CL_TRUE, CL_MAP_WRITE, 0, A_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, B = (data_t*)q.enqueueMapBuffer(buffer_b, CL_TRUE, CL_MAP_WRITE, 0, B_SIZE, NULL, NULL, &err));
    CHECK_MSG(err, C = (data_t*)q.enqueueMapBuffer(buffer_result, CL_TRUE, CL_MAP_READ, 0, C_SIZE, NULL, NULL, &err));


    // Initialize input data
    for (int i = 0; i < I; i++)
        for (int k = 0; k < K; k++) {
            A[i*K+k] = k;
        }

    for (int j = 0; j < J; j++)
        for (int k = 0; k < K; k++) {
            B[j*K+k] = k;
    }


    // Data will be migrated to device global memory
    CHECK_MSG(err, err = q.enqueueMigrateMemObjects({buffer_a, buffer_b}, 0 /* 0 means from host*/));

    // Launnch the VecAdd kernel
    CHECK_MSG(err, err = q.enqueueTask(kernel3));

    // Migrate the result data back to host memory
    CHECK_MSG(err, q.enqueueMigrateMemObjects({buffer_result}, CL_MIGRATE_MEM_OBJECT_HOST));

    // Wait for all the commands to complete
    CHECK_MSG(err, q.finish());

    // Verify the result
    int match = 0;
    for (int i = 0; i < I; i++)
        for (int j = 0; j < J; j++) {
            C_golden[i*J+j] = 0;
            for (int k = 0; k < K; k++) {
                C_golden[i*J+j] = C_golden[i*J+j] + A[i*K+k] * B[j*K+k];
            }
        }

    for (int i = 0; i < I; i++)
        for (int j = 0; j < J; j++) {
            if (fabs((float)C_golden[i*J+j] - (float)C[i*J+j]) > 0.001)
                match = 1;
                break;
        }


    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_a, A));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_b, B));
    CHECK_MSG(err, err = q.enqueueUnmapMemObject(buffer_result, C));
    CHECK_MSG(err, err = q.finish());

    std::cout << "TEST " << (match == 1 ? "FAILED!" : "PASSED!") << std::endl;
    return (match ? EXIT_FAILURE : EXIT_SUCCESS);
}
