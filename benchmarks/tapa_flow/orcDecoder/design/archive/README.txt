Environmental Setup

    1. Use vitis version 2021.2
    2. tapa version 0.0.20221113.1
    3. platform xilinx_u280_xdma_201920_3 (specified in Makefile)
    4. Update vitis_hls path in Makefile
    5. Update xilinx_xrt path in Makefile

Compiling and building the code

    1. To compile for csim run command "make gpp". To execute the program run "./decoder". The result should say Passed.
    2. To compile the code with AUTO tapa placement run the command "make rtl_gen".
    3. To compile the code with MANUAL tapa placement run the command "make Mrtl_gen".

NOTE1: link_hbm.ini contains the connectivity information. While compiling the code with tapa for both (2 and 3) enable-hbm-binding-adjustment
      flag is enabled. You will need to change the link_config.ini file for each port to be connected to two HBM banks for ping pong purpose.
NOTE2: for hardware runs change the "wait_count" variable in "data_decoder_host.h" to value of 80, for csim keep it to 2147483

EXPECTED RESULTS with certain configurations.

Config 1. AUTO placement by tapa with each port connected to one HBM bank. ACHIEVED FREQ RANGE(200~210)
Config 2. AUTO placement by tapa with each port connected to two HBM banks. ACHIEVED FREQ RANGE(195~200)
Config 3. MANUAL placement by tapa with each port connected to two HBM banks. ACHIEVED FREQ RANGE(210~215)
Config 3. MANUAL placement by tapa with each port connected to two HBM banks AND route strategy  of "AggressiveExplore". ACHIEVED FREQ RANGE(220~225)
