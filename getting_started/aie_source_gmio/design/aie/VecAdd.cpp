
#include <adf.h>
#include "common.h"
#include "VecAdd.h"
#if !defined(__AIESIM__) && !defined(__X86SIM__) && !defined(__ADF_FRONTEND__)
    #include "adf/adf_api/XRTConfig.h"
    #include "experimental/xrt_kernel.h"
#endif

VecAdd gr;
int main(int argc, char ** argv)
{
#if !defined(__AIESIM__) && !defined(__X86SIM__) && !defined(__ADF_FRONTEND__)
    // Create XRT device handle for ADF API
    char* xclbinFilename = argv[1];
    auto dhdl = xrtDeviceOpen(0);//device index=0
    xrtDeviceLoadXclbinFile(dhdl,xclbinFilename);
    xuid_t uuid;
    xrtDeviceGetXclbinUUID(dhdl, uuid);
    adf::registerXRT(dhdl, uuid);
#endif
    gr.init();

    const int BLOCK_SIZE=DATA_NUM;
    int32 *inputArray1=(int32*)adf::GMIO::malloc(BLOCK_SIZE*sizeof(int32));
    int32 *inputArray2=(int32*)adf::GMIO::malloc(BLOCK_SIZE*sizeof(int32));
    int32 *outputArray=(int32*)adf::GMIO::malloc(BLOCK_SIZE*sizeof(int32));
    // provide input data to AI Engine in inputArray
    for (int i=0; i<BLOCK_SIZE; i++) {
        inputArray1[i] = i;
        inputArray2[i] = i;
    }
    gr.m_s0.gm2aie_nb(inputArray1, BLOCK_SIZE*sizeof(int32));
    gr.m_s1.gm2aie_nb(inputArray2, BLOCK_SIZE*sizeof(int32));
    gr.m_s2.aie2gm_nb(outputArray, BLOCK_SIZE*sizeof(int32));
    gr.run(1);
    gr.m_s2.wait();
    std::cout<<"[INFO] GMIO transactions finished"<<std::endl;
    adf::GMIO::free(inputArray1);
    adf::GMIO::free(inputArray2);
    adf::GMIO::free(outputArray);
    gr.end();

#if !defined(__AIESIM__) && !defined(__X86SIM__) && !defined(__ADF_FRONTEND__)
    xrtDeviceClose(dhdl);
#endif

    return 0;
}
