#include "data_decoder_host.h"

void data_decoding(tapa::mmap<_512b> input_port,
                    tapa::mmap<_512b> output_port0_32b_8b,
                    tapa::mmap<_512b> output_port1_16b_8b,
                    tapa::mmap<_512b> output_port2_16b_8b,
                    tapa::mmap<_512b> output_port3_8b,
                    tapa::mmap<_128b> output_port4_Track,
                    uint32_t wait_count,
                    uint32_t data_count
                    // uint32_t KRNL_Data_Write
                    );

DEFINE_string(bitstream, "", "path to bitstream file, run csim if empty");


void async_readnorm(struct aiocb* aio_rf, void* data_in, int Fd, int vector_size_bytes, int offset)
{
    aio_rf->aio_buf = data_in;
    aio_rf->aio_fildes = Fd;
    aio_rf->aio_nbytes = vector_size_bytes;
    aio_rf->aio_offset = offset;
    int result = aio_read(aio_rf);
    if (result < 0)
    {
        printf("Read Failed: %d \n", result);
    }
}

int verif(uint8_t *dataPtr);

int verif_all(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track);

void update_patch_data(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track);

int verif_all_Meta(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track,
                    int32_t *DATA_OUT);

int main(int argc, char* argv[]) {
    gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);

    // std::string read_file = "/localhdd/awa159/orc_decoder/DIRECT_DECODER/32_bit_data_orc.bin";
    // std::string check_file = "/localhdd/awa159/orc_decoder/DIRECT_DECODER/32_bit_data.bin";
    uint32_t ORIG_file_size_bytes = 0;
    uint32_t file_size_rem = 0;
    uint32_t KRNL_file_size_bytes = 0;
    uint32_t file_size_bytes = 0;
    uint32_t Data_offset = 0;
    uint32_t Data_length = 0;
    uint32_t KRNL_Data_Write = 0;
    std::string nvme_file;



    nrows = Myrows;
    nvme_file = read_file;
    std::ifstream input_file(read_file, std::ios::binary);
    if (!input_file) {
        std::cerr << "Error: failed to open input file." << std::endl;
        return 1;
    }

    // Get the total file size
    input_file.seekg(0, std::ios::end);
    std::streampos file_size = input_file.tellg();
    input_file.close();

    Data_length = uint32_t(file_size);
    ORIG_file_size_bytes = Data_length;

    Data_offset = 0;



    ORIG_file_size_bytes = Data_length;
    file_size_bytes = Data_length;

    file_size_bytes = ORIG_file_size_bytes/FILE_CHUNKS;
    //Only uncomment if O_DIRECT READ
    // file_size_rem = ORIG_file_size_bytes % 4096;
    // if(file_size_rem != 0)
    // {
    //     file_size_bytes = ORIG_file_size_bytes/4096;
    //     file_size_bytes = (file_size_bytes + 1) * 4096;
    // }

    std::cout << "Chunk file size: " << file_size_bytes << " bytes" << std::endl;

    file_size_rem = ORIG_file_size_bytes%64;
    if(file_size_rem!=0)
    {
        KRNL_file_size_bytes = ORIG_file_size_bytes + (64 - file_size_rem);
    }
    else
    {
        KRNL_file_size_bytes = ORIG_file_size_bytes;
    }
    KRNL_file_size_bytes = KRNL_file_size_bytes + 576;  //the pipeline depth of FPGA 64*8=512 + 64 = 576
    std::cout << "KRNL_file_size_bytes: " << KRNL_file_size_bytes << " bytes" << std::endl;
    std::cout << "Number of rows are: " << nrows << std::endl;
    uint32_t remDW = nrows%64;
    KRNL_Data_Write = nrows/64;
    if(remDW!=0)
    {
        KRNL_Data_Write += 1;
    }
    std::cout << "KRNL_Data_Write: " << KRNL_Data_Write << std::endl;


    ///////DECLARE READ WRITE HOST PTRs////////
        uint32_t remDiv = nrows%16;
        uint64_t dOut_Size_A = nrows / 16;   //bcz of short repeat. else its nrows/16. One 512 can worst case contain 3 numbers.
        if(remDiv!=0)
        {
            dOut_Size_A = (dOut_Size_A + 1);
        }
        // dOut_Size_A = dOut_Size_A*4;
        std::cout << "dOut_Size_A:  " << dOut_Size_A << std::endl;

        std::vector<_512b, tapa::aligned_allocator<_512b>> data_in(KRNL_file_size_bytes/64);
        std::vector<_512b, tapa::aligned_allocator<_512b>> data_out(dOut_Size_A);   //contain SR as well. by default it should be dOut_Size_A/4
        std::vector<_512b, tapa::aligned_allocator<_512b>> data_out1(dOut_Size_A);
        std::vector<_512b, tapa::aligned_allocator<_512b>> data_out2(dOut_Size_A);
        std::vector<_512b, tapa::aligned_allocator<_512b>> data_out3(dOut_Size_A);
        std::vector<_128b, tapa::aligned_allocator<_128b>> track_data(dOut_Size_A*2);   //Multiply by 4 bcz all info is there *2 bcz it has PLL info

        uint64_t dOut_Size = (nrows * 4);   //for 32 bit data with 4 bytes
        uint32_t dOut_Size_H = dOut_Size/2;
        uint32_t dOut_Size_HH = dOut_Size/4;

        std::cout << "dOut_Size:  " << dOut_Size << std::endl;
        std::cout << "dOut_Size_H:  " << dOut_Size_H << std::endl;
        std::cout << "dOut_Size_HH:  " << dOut_Size_HH << std::endl;

    ///////////////////////////

    ///////Getting nvme ssd file desc////////
        auto FileTimeS = std::chrono::steady_clock::now();

        nvmeFd = open(nvme_file.c_str(), O_RDONLY); //O_SYNC O_DIRECT  O_RDONLY  O_RDWR
        if (nvmeFd < 0) {
            std::cerr << "ERROR: open " << nvme_file << "failed: " << std::endl;
            return EXIT_FAILURE;
        }
        auto FileTimeE = std::chrono::steady_clock::now();
        auto FileTime = std::chrono::duration_cast<std::chrono::microseconds>(FileTimeE - FileTimeS);
        std::cout << "File Opening Time (us):  " << FileTime.count() << std::endl;
        std::cout << "INFO: Successfully opened NVME SSD1 " << nvme_file << std::endl;
    ///////////////////////////


    off_t offset = Data_offset;
    if (lseek(nvmeFd, offset, SEEK_SET) == -1) {
        perror("Error setting file offset");
        close(nvmeFd);
        return 1;
    }
    ssize_t bytes_read = read(nvmeFd, (void *)(data_in.data()), ORIG_file_size_bytes);
    std::cout << "Bytes Read:" << bytes_read << std::endl;

    int NRCOUNT = 1;
    int64_t kernel_time_ns = 0;

    KRNL_file_size_bytes = KRNL_file_size_bytes/64;
    for (int k = 0; k < NRCOUNT; k++)
    {
        kernel_time_ns += tapa::invoke(
            data_decoding, FLAGS_bitstream,
            tapa::read_only_mmap<_512b>(data_in),
            tapa::write_only_mmap<_512b>(data_out),
            tapa::write_only_mmap<_512b>(data_out1),
            tapa::write_only_mmap<_512b>(data_out2),
            tapa::write_only_mmap<_512b>(data_out3),
            tapa::write_only_mmap<_128b>(track_data),
            wait_count,
            KRNL_file_size_bytes
            // KRNL_Data_Write
        );
        // std::cout << "Kernel Exec time(ms): " << (kernel_time_ns) * 1e-6 << std::endl;
    }

    std::cout << "Kernel Exec time(ms): " << (kernel_time_ns/NRCOUNT) * 1e-6 << std::endl;
    std::cout << "Data Input Size (MB): " << (float)(ORIG_file_size_bytes/(1024.0)/1024.0) << std::endl;
    std::cout << "Data Output Size (MB): " << (float)((dOut_Size_A*4)/(1024.0*1024.0)) << std::endl;
    std::cout << "Kernel Input throughput(GB/s): " << (float)(ORIG_file_size_bytes)/(float)(kernel_time_ns/NRCOUNT) << std::endl;
    std::cout << "Kernel Output throughput(GB/s): " << (float)(nrows*4)/(float)(kernel_time_ns/NRCOUNT) << std::endl;


    int kernel_dout = 0;
    ap_uint<AXI_WIDTH> buf_out = 0;
    int32_t* data_OUT = reinterpret_cast<int32_t*>(aligned_alloc(4096, nrows*sizeof(int32_t)));
    //Data Verification
    #if 1
        update_patch_data(reinterpret_cast<int32_t*>(data_out.data()),
                    reinterpret_cast<int32_t*>(data_out1.data()),
                    reinterpret_cast<int32_t*>(data_out2.data()),
                    reinterpret_cast<int32_t*>(data_out3.data()),
                    reinterpret_cast<int32_t*>(track_data.data())
                    );
        verif_all(reinterpret_cast<int32_t*>(data_out.data()),
                    reinterpret_cast<int32_t*>(data_out1.data()),
                    reinterpret_cast<int32_t*>(data_out2.data()),
                    reinterpret_cast<int32_t*>(data_out3.data()),
                    reinterpret_cast<int32_t*>(track_data.data())
                    );
    #endif

    // compare data_in with data_out
    #if 0
        bool d_check = 0;
        int j = 0;
        // for(int i = 0; i < kernel_d_count; i++)
        // {
        //     j = i%32==0 ? j+1 : j;
        //     if(data_in[j] != data_out[i])
        //     {
        //         d_check = 1;
        //         std::cout << "Data mismatch at: " << i << std::endl;
        //         break;
        //     }
        //     ++j;
        // }
        // if(d_check)
        // {
        //     std::cout << "---Failed---" << std::endl;
        // }
        // else
        // {
        //     std::cout << "---Passed---" << std::endl;
        // }
    #endif


    // Printing out data
    #if 0
        for(int i = 0; i < (dOut_Size_A/4); i ++)
        {
            buf_out = data_out[i];
            std::cout << "Hex value D0 Out: " << std::setfill('0')
            << std::setw(64) << std::hex << buf_out << std::endl << std::dec;

            buf_out = data_out1[i];
            std::cout << "Hex value D1 Out: " << std::setfill('0')
            << std::setw(64) << std::hex << buf_out << std::endl << std::dec;

            buf_out = data_out2[i];
            std::cout << "Hex value D2 Out: " << std::setfill('0')
            << std::setw(64) << std::hex << buf_out << std::endl << std::dec;

            buf_out = data_out3[i];
            std::cout << "Hex value D3 Out: " << std::setfill('0')
            << std::setw(64) << std::hex << buf_out << std::endl << std::dec;
        }

    #endif

    //print all numbers
    #if 0
        for(int i = 0; i < (dOut_Size_A/4); i ++)
        {
            buf_out = data_out[i];
            for(int j = 0; j < 16; j++)
            {
                kernel_dout = buf_out.range(31,0);
                std::cout << kernel_dout << std::endl;
                buf_out = buf_out >> 32;
            }
            buf_out = data_out1[i];
            for(int j = 0; j < 16; j++)
            {
                kernel_dout = buf_out.range(31,0);
                std::cout << kernel_dout << std::endl;
                buf_out = buf_out >> 32;
            }
            buf_out = data_out2[i];
            for(int j = 0; j < 16; j++)
            {
                kernel_dout = buf_out.range(31,0);
                std::cout << kernel_dout << std::endl;
                buf_out = buf_out >> 32;
            }
            buf_out = data_out3[i];
            for(int j = 0; j < 16; j++)
            {
                kernel_dout = buf_out.range(31,0);
                std::cout << kernel_dout << std::endl;
                buf_out = buf_out >> 32;
            }
        }
    #endif

    return 0;
}

int verif_all(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track)
{
    int64_t kernel_dout = 0;
    ap_int<AXI_WIDTH> buf_out0 = 0;
    ap_int<AXI_WIDTH> buf_out1 = 0;
    ap_int<AXI_WIDTH> buf_out2 = 0;
    ap_int<AXI_WIDTH> buf_out3 = 0;

    ap_int<AXI_WIDTH> *Data_Out0;
    Data_Out0 = (ap_int<AXI_WIDTH>*)(datain0);

    ap_int<AXI_WIDTH> *Data_Out1;
    Data_Out1 = (ap_int<AXI_WIDTH>*)(datain1);

    ap_int<AXI_WIDTH> *Data_Out2;
    Data_Out2 = (ap_int<AXI_WIDTH>*)(datain2);

    ap_int<AXI_WIDTH> *Data_Out3;
    Data_Out3 = (ap_int<AXI_WIDTH>*)(datain3);

    _128b *mTr;
    mTr = (_128b*)(track);

    std::ifstream in_file(check_file);

    if (!in_file) {
        std::cerr << "Error: failed to open input file." << std::endl;
        return -1;
    }

    std::string line;
    int j = 0;
    int n = 0;
    int d0_iter = 0;
    int d1_iter = 0;
    int d2_iter = 0;
    int d3_iter = 0;
    uint32_t tRun = 0;

    uint32_t batch = 0;

    uint16_t decType = 0;
    uint16_t runLength = 0;
    uint8_t PLL = 0;
    int64_t number = 0;

    while(n < nrows)
    {
        j = 0;
        batch = 0;

        PLL = mTr->range(7,0);      //8
        decType = mTr->range(79,64);  //16
        runLength = mTr->range(95,80);    //16
        // mTr++;

        if(PLL!=0)
        {
            mTr++;
        }
        else
        {
            if(runLength <= 64)
            {
                tRun = runLength;
            }
            else
            {
                tRun = 64;
            }

            while ((batch < tRun) && (n < nrows))
            {
                std::getline(in_file, line);
                if(j == 0)
                {
                    buf_out0 = Data_Out0[d0_iter];       //Data_Out_Check
                    buf_out1 = Data_Out1[d1_iter];       //Data_Out_Check
                    buf_out2 = Data_Out2[d2_iter];       //Data_Out_Check
                    buf_out3 = Data_Out3[d3_iter];       //Data_Out_Check

                    d0_iter++;
                    d1_iter++;
                    d2_iter++;
                    d3_iter++;
                    mTr++;

                    kernel_dout = buf_out0.range(31,0);
                    buf_out0 = buf_out0 >> 32;
                    ++j;

                }
                else
                {
                    if (j > 47) {
                        kernel_dout = buf_out3.range(31, 0);
                        buf_out3 = buf_out3 >> 32;
                    } else if (j > 31) {
                        kernel_dout = buf_out2.range(31, 0);
                        buf_out2 = buf_out2 >> 32;
                    }
                    else if (j > 15) {
                        kernel_dout = buf_out1.range(31, 0);
                        buf_out1 = buf_out1 >> 32;
                    }
                    else {
                        kernel_dout = buf_out0.range(31, 0);
                        buf_out0 = buf_out0 >> 32;
                    }
                    j+=1;
                }

                try {

                    if (line.find_first_not_of("0123456789") == std::string::npos) {
                    } else {
                        number = std::stoll(line);
                    }
                    // int64_t number = std::stoll(line);
                    n++;
                    if(number != kernel_dout)
                    {
                        std::cout << "number mismatch at: " << n << " ; Actual Data: " << number << " ; Kernel Data: " << kernel_dout << std::endl;
                        std::cout << "DEBUG J_val: " << j << std::endl;
                        std::cout << "Total Numbers are: " << nrows << std::endl;
                        in_file.close();
                        return -1;
                    }
                    // std::cout << number << std::endl;
                } catch (const std::exception& e) {
                    std::cerr << "Error: Invalid number format in line: " << line << std::endl;
                }
                ++batch;



            }

        }

    }

    if(n >= nrows)
    {
        std::cout << "Passed, Total Numbers matched: " << n << std::endl;
    }
    else
    {
        std::cout << "Failed, Total Numbers matched: " << n << std::endl;
    }

    in_file.close();
    return 1;
}


void update_patch_data(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track)
{

    _128b *mTr;
    mTr = (_128b*)(track);

    uint16_t decType = 0;
    uint16_t runLength = 0;
    int32_t BV = 0;
    uint8_t PLL = 0;
    uint16_t gap_val = 0;
    int32_t patch_val = 0;

    int32_t totalCount = nrows;

    bool latchRL = 1;
    bool latchPA = 1;
    uint16_t TRL = 0;
    uint32_t data_count = 0;
    uint32_t crow = 0;
    uint32_t patch_Didx = 0;
    uint16_t offset_gap = 0;
    uint16_t gap_mod = 0;
    uint16_t prev_gap = 0;
    uint16_t dataPtr = 0;
    uint16_t subVal = 0;
    uint32_t fdiv = 0;
    uint16_t offset = 0;
    uint32_t pll_count = 0;
    uint32_t Data_idx = 0;

    while(crow < totalCount)
    {

        PLL = mTr->range(7,0);      //8
        gap_val = mTr->range(23,8);   //16
        patch_val = mTr->range(55,24);         //32
        decType = mTr->range(79,64);  //16
        runLength = mTr->range(95,80);    //16
        BV = mTr->range(127,96);       //32

        mTr++;
        if(latchRL)
        {
            latchRL = 0;
            TRL = runLength;
        }


        if(decType != PATCHED)
        {
            //Skip
            data_count += 16;
            latchPA = 1;
            //loop control
            if(TRL <= 64)
            {
                latchRL = 1;
                crow += TRL;
                TRL = 0;
            }
            else
            {
                TRL -= 64;
                crow += 64;
            }

        }
        else
        {
            //fix for PLL count to relatch the RL and PA latch
            //get the start idx from where the patched data is starting, only once
            if(latchPA)
            {
                latchPA = 0;
                patch_Didx = data_count; //not subtracting bcz added afterwards
                // std::cout << "patch_Didx: " << patch_Didx << std::endl;
            }
            //Process
            if(PLL!=0)  //reading the Patch Gap values
            {
                pll_count += 1;
                if(pll_count == PLL)
                {
                    crow += TRL;    //add in the end bcz of last data
                    pll_count = 0;
                    latchRL = 1;
                    latchPA = 1;
                }
                //get data index from gap and add the patch value
                if(gap_val == 255 and patch_val == 0)
                {
                    //skip to next, no data updates
                    offset_gap = gap_val;
                }
                else    //update the data
                {
                    gap_val +=  prev_gap;
                    gap_val += offset_gap;
                    offset_gap = 0;
                    prev_gap = gap_val;

                    gap_mod = gap_val%64;   //batch repeat after 64
                    dataPtr = gap_mod/16;   //pointer repeats after 16

                    fdiv = gap_val/64;
                    subVal = (fdiv*64)+(dataPtr*16);
                    offset = gap_val-subVal;

                    Data_idx = (fdiv*16) + patch_Didx + offset;

                    switch (dataPtr)
                    {
                        case 0:
                            datain0[Data_idx] += patch_val;
                            break;
                        case 1:
                            datain1[Data_idx] += patch_val;
                            break;
                        case 2:
                            datain2[Data_idx] += patch_val;
                            break;
                        case 3:
                            datain3[Data_idx] += patch_val;
                            break;

                        default:
                            break;
                    }
                }

            }
            else        //keep reading metadata till you find PLL
            {
                //skip
                data_count += 16;
                prev_gap = 0;
                //loop control
                if(TRL <= 64)
                {
                    // latchRL = 1;
                    // latchPA = 1;
                    // crow += TRL;
                    TRL = 0;
                }
                else
                {
                    TRL -= 64;
                    crow += 64;
                }

            }
        }
    }

}


int verif_all_Meta(int32_t *datain0, int32_t *datain1, int32_t *datain2, int32_t *datain3, int32_t *track,
                    int32_t *DATA_OUT)
{
    int64_t kernel_dout = 0;
    int32_t buf_out0 = 0;
    int32_t buf_out1 = 0;
    int32_t buf_out2 = 0;
    int32_t buf_out3 = 0;

    int32_t *dOUt_0;
    dOUt_0 = (int32_t*)(datain0);

    int32_t *dOUt_1;
    dOUt_1 = (int32_t*)(datain1);

    int32_t *dOUt_2;
    dOUt_2 = (int32_t*)(datain2);

    int32_t *dOUt_3;
    dOUt_3 = (int32_t*)(datain3);

    std::ifstream in_file(check_file);

    if (!in_file) {
        std::cerr << "Error: failed to open input file." << std::endl;
        return -1;
    }


    _128b *mTr;
    mTr = (_128b*)(track);

    int j = 0;
    int n = 0;
    int d0_iter = 0;
    int d1_iter = 0;
    int d2_iter = 0;
    int d3_iter = 0;

    std::string line;

    uint16_t decType = 0;
    uint16_t runLength = 0;
    int32_t BV = 0;
    uint32_t batch = 0;
    uint8_t PLL = 0;
    uint16_t gap_val = 0;
    int32_t patch_val = 0;

    int32_t writeRowCount = nrows;
    int merged_data_index = 0;
    int ind_data_index = 0;
    uint32_t gap = 0;
    int32_t patch = 0;

    std::vector<uint32_t> myGaps;
    std::vector<int32_t> myPatch;

    int myCount = 0;
    int pll_count = 0;
    int read_count = 0;
    int gap_idx = 0;
    int patch_idx = 0;
    int merge_IDX = 0;
    int myIdx = 0;
    int tIdx = 0;
    int Dsum = 0;
    int myDIdx = 0;
    int ptr_IDX = 0;
    int cnum = 0;
    bool getMeta = true;
    bool meta_read = true;
    bool Mproc_check = 0;
    int dItr = 0;

    bool dRead = false;

    while (writeRowCount >= 0)
    {

        if(meta_read)
        {
            meta_read = false;
            myCount = 1;
            PLL = mTr->range(7,0);      //8
            gap_val = mTr->range(23,8);   //16
            patch_val = mTr->range(55,24);         //32
            decType = mTr->range(79,64);  //16
            runLength = mTr->range(95,80);    //16
            BV = mTr->range(127,96);       //32
        }


        if(decType != PATCHED)
        {
            dRead = true;
            meta_read = true;
            Mproc_check = false;
            mTr++;


        }
        else
        {
            if(getMeta)
            {
                while(PLL == 0) //consume all meta till there is some PLL and dectype is PATCHED
                {
                    myCount += 1;
                    PLL = mTr->range(7,0);      //8
                    gap_val = mTr->range(23,8);   //16
                    patch_val = mTr->range(55,24);         //32
                    decType = mTr->range(79,64);  //16
                    runLength = mTr->range(95,80);    //16
                    BV = mTr->range(127,96);       //32
                    mTr++;
                }
                pll_count += 1;

                myGaps.push_back(gap_val);
                myPatch.push_back(patch_val);

                while(pll_count != PLL)
                {

                    PLL = mTr->range(7,0);      //8
                    gap_val = mTr->range(23,8);   //16
                    patch_val = mTr->range(55,24);         //32
                    decType = mTr->range(79,64);  //16
                    runLength = mTr->range(95,80);    //16
                    BV = mTr->range(127,96);       //32

                    myGaps.push_back(gap_val);
                    myPatch.push_back(patch_val);

                    pll_count += 1;
                    mTr++;
                }


                getMeta = false;
                gap_idx = 0;
                patch_idx = 0;
                gap = myGaps[gap_idx];
                patch = myPatch[patch_idx];

            }

            if(read_count == myCount-2)
            {
                // std::cout << "read_count RS: " << read_count << std::endl;
                read_count = 0;
                myCount = 0;
                pll_count = 0;
                myGaps.clear();   // Clear the vector to remove all elements
                myPatch.clear();  // Clear the vector to remove all elements
                getMeta = true;
                meta_read = true;
                dRead = false;
                Mproc_check = false;
            }
            else
            {
                read_count++;
                getMeta = false;
                meta_read = false;
                dRead = true;
                Mproc_check = true;
            }

        }


        if(dRead)
        {
            merged_data_index += 64;
            if(runLength < 64)
            {
                writeRowCount -= runLength;
            }
            else
            {
                writeRowCount -= 64;
            }

            ind_data_index += 16;

            if(Mproc_check)
            {
                merge_IDX = merged_data_index%runLength;
                if((uint32_t)(merged_data_index/runLength)!=0)
                {
                    merge_IDX = (merge_IDX == 0) ? 512:merge_IDX;
                }
                myDIdx = ind_data_index - 16;
                if(gap == 255 and patch == 0)
                {
                    gap_idx++;
                    patch_idx++;
                    gap = gap + (myGaps[gap_idx]);
                    patch = (myPatch[patch_idx]);
                }

                if(gap < merge_IDX) //gap exists in this run
                {

                    myIdx = merge_IDX-64;
                    while(myIdx != merge_IDX)  //check 64 values
                    {
                        if(myIdx == gap)
                        {
                            ptr_IDX = myIdx-((myDIdx*4)%runLength);
                            ptr_IDX = ptr_IDX/16;        //pointer number

                            tIdx = myIdx%16;    //data_indx

                            switch (ptr_IDX)
                            {
                                case 0:
                                    dOUt_0[tIdx+myDIdx] += patch;
                                    break;
                                case 1:
                                    dOUt_1[tIdx+myDIdx] += patch;
                                    break;
                                case 2:
                                    dOUt_2[tIdx+myDIdx] += patch;
                                    break;
                                case 3:
                                    dOUt_3[tIdx+myDIdx] += patch;
                                    break;

                                default:
                                    break;
                            }

                            gap_idx++;
                            patch_idx++;
                            gap = (myGaps[gap_idx]);
                            patch = (myPatch[patch_idx]);
                            if(gap == 255 and patch == 0)
                            {
                                gap_idx++;
                                patch_idx++;
                                gap = gap + (myGaps[gap_idx]);
                                patch = (myPatch[patch_idx]);
                            }
                            gap += myIdx;
                        }
                        else if(gap > merge_IDX)
                        {
                            break;
                        }
                        myIdx++;
                    }
                }
            }


            cnum = 0;
            //match the numbers
            while((cnum < runLength) && (cnum < 64))
            {
                std::getline(in_file, line);
                int64_t number = 0;
                try {
                    if (line.find_first_not_of("0123456789") == std::string::npos) {
                    } else {
                        number = std::stoll(line);
                    }

                } catch (const std::invalid_argument& e) {
                    std::cerr << "Invalid argument exception: " << e.what() << std::endl;
                } catch (const std::out_of_range& e) {
                    std::cerr << "Out of range exception: " << e.what() << std::endl;
                }
                ++n;
                if(cnum < 16)
                {
                    kernel_dout = dOUt_0[(dItr*16)+(cnum%16)];
                }
                else if(cnum < 32)
                {
                    kernel_dout = dOUt_1[(dItr*16)+(cnum%16)];
                }
                else if(cnum < 48)
                {
                    kernel_dout = dOUt_2[(dItr*16)+(cnum%16)];
                }
                else
                {
                    kernel_dout = dOUt_3[(dItr*16)+(cnum%16)];
                }
                ++cnum;
                if(number != kernel_dout)
                {
                    std::cout << "number mismatch at: " << n << " ; Actual Data: " << number << " ; Kernel Data: " << kernel_dout << std::endl;
                    std::cout << "Total Numbers are: " << nrows << std::endl;
                    in_file.close();
                    return -1;
                }

            }
            dItr++;
        }


    }

    if(n >= nrows)
    {
        std::cout << "Passed, Total Numbers matched: " << n  << " from: " << nrows << std::endl;
    }
    else
    {
        std::cout << "Failed, Total Numbers matched: " << n  << " from: " << nrows << std::endl;
    }
    in_file.close();


    return 1;
}
