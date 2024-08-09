// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include <cstdint>
#include <tapa.h>
#include "typedefs.h"

static int popcount(WholeDigitType x)
{
  // most straightforward implementation
  // actually not bad on FPGA
  int cnt = 0;
  for (int i = 0; i < 256; i ++ )
  {
#pragma HLS unroll
    cnt = cnt + x(i, i);
  }
  return cnt;
}

static void update_knn( WholeDigitType test_inst, WholeDigitType train_inst, int min_distances[K_CONST] )
{
  #pragma HLS inline
#pragma HLS array_partition variable=min_distances complete dim=0


  // Compute the difference using XOR
  WholeDigitType diff = test_inst ^ train_inst;

  int dist = 0;

  dist = popcount(diff);

  int max_dist = 0;
  int max_dist_id = 0;
  int k = 0;

  // Find the max distance
  FIND_MAX_DIST: for ( int k = 0; k < K_CONST; ++k )
  {
    if ( min_distances[k] > max_dist )
    {
      max_dist = min_distances[k];
      max_dist_id = k;
    }
  }

  // Replace the entry with the max distance
  if ( dist < max_dist )
    min_distances[max_dist_id] = dist;

  return;
}


static void knn_vote_small( int knn_set[2 * K_CONST],
		                  int min_distance_list[K_CONST],
						  int label_list[K_CONST],
						  LabelType label_in)
{
  #pragma HLS inline
#pragma HLS array_partition variable=knn_set complete dim=0
  // final K nearest neighbors
  #pragma HLS array_partition variable=min_distance_list complete dim=0
  // labels for the K nearest neighbors
  #pragma HLS array_partition variable=label_list complete dim=0


  int pos = 1000;



  // go through all the lanes
  // do an insertion sort to keep a sorted neighbor list
  LANES: for (int i = 0; i < 2; i ++ )
  {
    INSERTION_SORT_OUTER: for (int j = 0; j < K_CONST; j ++ )
    {
      #pragma HLS pipeline
      pos = 1000;
      INSERTION_SORT_INNER: for (int r = 0; r < K_CONST; r ++ )
      {
        #pragma HLS unroll
        pos = (
        		(knn_set[i*K_CONST+j] < min_distance_list[r])
				&&
				(pos > K_CONST)
			  ) ? r : pos;
        //printf("i=%d, j=%d, r=%d, pos=%d\n", i, j, r, pos);
      }

      INSERT: for (int r = K_CONST ;r > 0; r -- )
      {
        #pragma HLS unroll
        if(r-1 > pos)
        {
          min_distance_list[r-1] = min_distance_list[r-2];
          label_list[r-1] = label_list[r-2];
        }
        else if (r-1 == pos)
        {
          min_distance_list[r-1] = knn_set[i*K_CONST+j];
          label_list[r-1] = label_in;
        }
      }
      //printf("min_distance_list[%d]=%d, min_distance_list[%d]=%d, min_distance_list[%d]=%d\n",0,
    	//	  min_distance_list[0],
		//	  1,
		//	  min_distance_list[1],
		//	  2,
		//	  min_distance_list[2]);
     // printf("label_list[%d]=%d, label_list[%d]=%d, label_list[%d]=%d\n",
    		//  0,
			//  label_list[0],
		//	  1,
		//	  label_list[1],
		//	  2,
		//	  label_list[2]);

    }
  }
}


static LabelType knn_vote_final(int label_list[K_CONST])
{
#pragma HLS array_partition variable=label_list complete dim=0
#pragma HLS inline

  int vote_list[10];
#pragma HLS array_partition variable=vote_list complete dim=0


  INIT_2: for (int i = 0;i < 10; i ++ )
  {
    #pragma HLS unroll
    vote_list[i] = 0;
  }

  // vote
  INCREMENT: for (int i = 0;i < K_CONST; i ++ )
  {
    #pragma HLS pipeline
    vote_list[label_list[i]] += 1;
  }

  LabelType max_vote;
  max_vote = 0;

  // find the maximum value
  VOTE: for (int i = 0;i < 10; i ++ )
  {
    #pragma HLS unroll
    if(vote_list[i] >= vote_list[max_vote])
    {
      max_vote = i;
    }
  }

  return max_vote;

}



#define NUM1 1
void update_knn1(
  tapa::istream<bit512>& Input_1,
	tapa::ostream<ap_uint<32>>& Output_1
)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;
bit32 tmp;

static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

static bit512 in_tmp;

WholeDigitType data_temp;

for (int index=0; index<NUM_TEST; index++){
  printf("index=%d\n", index);
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW / 2; i++){
    #pragma HLS pipeline
    in_tmp = Input_1.read();
		training_set[2*i  ](255, 224) =in_tmp(31,    0);
		training_set[2*i  ](223, 192) =in_tmp(63,   32);
		training_set[2*i  ](191, 160) =in_tmp(95,   64);
		training_set[2*i  ](159, 128) =in_tmp(127,  96);
		training_set[2*i  ](127,  96) =in_tmp(159, 128);
		training_set[2*i  ](95,   64) =in_tmp(191, 160);
		training_set[2*i  ](63,   32) =in_tmp(223, 192);
		training_set[2*i  ](31,    0) =in_tmp(255, 224);
		training_set[2*i+1](255, 224) =in_tmp(287, 256);
		training_set[2*i+1](223, 192) =in_tmp(319, 288);
		training_set[2*i+1](191, 160) =in_tmp(351, 320);
		training_set[2*i+1](159, 128) =in_tmp(383, 352);
		training_set[2*i+1](127,  96) =in_tmp(415, 384);
		training_set[2*i+1](95,   64) =in_tmp(447, 416);
		training_set[2*i+1](63,   32) =in_tmp(479, 448);
		training_set[2*i+1](31,    0) =in_tmp(511, 480);
                // for (int j=0; j<16; j++){ printf("%08x_", (unsigned int) in_tmp(j*32+31, j*32)); }
                // printf("\n");
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM1)/2; i++)
	  {
#pragma HLS pipeline
                in_tmp = Input_1.read();
		tmp(31, 0) = in_tmp(31,    0); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(63,   32); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(95,   64); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(127,  96); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(159, 128); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(191, 160); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(223, 192); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(255, 224); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(287, 256); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(319, 288); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(351, 320); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(383, 352); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(415, 384); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(447, 416); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(479, 448); Output_1.write(tmp);
		tmp(31, 0) = in_tmp(511, 480); Output_1.write(tmp);
                // for (int j=0; j<16; j++){ printf("%08x_", (unsigned int) in_tmp(j*32+31, j*32)); }
                // printf("\n");

	  }
  }


  if(index%2 == 0){
    in_tmp = Input_1.read();
    test_instance(255, 224) = in_tmp(31,    0);
    test_instance(223, 192) = in_tmp(63,   32);
    test_instance(191, 160) = in_tmp(95,   64);
    test_instance(159, 128) = in_tmp(127,  96);
    test_instance(127,  96) = in_tmp(159, 128);
    test_instance(95,   64) = in_tmp(191, 160);
    test_instance(63,   32) = in_tmp(223, 192);
    test_instance(31,    0) = in_tmp(255, 224);
    tmp(31,0) = test_instance(255, 224);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(223, 192);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(191, 160);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(159, 128);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(127,  96);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(95,   64);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(63,   32);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(31,    0);
    Output_1.write(tmp);
  }else{
    test_instance(255, 224) = in_tmp(287,  256);
    test_instance(223, 192) = in_tmp(319,  288);
    test_instance(191, 160) = in_tmp(351,  320);
    test_instance(159, 128) = in_tmp(383, 352);
    test_instance(127,  96) = in_tmp(415, 384);
    test_instance(95,   64) = in_tmp(447, 416);
    test_instance(63,   32) = in_tmp(479, 448);
    test_instance(31,    0) = in_tmp(511, 480);
    tmp(31,0) = test_instance(255, 224);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(223, 192);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(191, 160);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(159, 128);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(127,  96);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(95,   64);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(63,   32);
    Output_1.write(tmp);
    tmp(31,0) = test_instance(31,    0);
    Output_1.write(tmp);
  }


  int min_distance_list[K_CONST];
#pragma HLS array_partition variable=min_distance_list complete dim=0

  int label_list[K_CONST];
#pragma HLS array_partition variable=label_list complete dim=0



  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = 256;
	  label_list[i] = 0;
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update1");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 0;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

  }
}


#define NUM2 2
void update_knn2(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if(index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM2); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();

  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update2");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 0;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }

   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}

#define NUM3 3
void update_knn3(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if(index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM3); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();

  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update3");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 1;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }

   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}



#define NUM4 4
void update_knn4(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;


for (int index=0; index<NUM_TEST; index++){
  if(index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM4); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }


  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 1;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}



#define NUM5 5
void update_knn5(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;


for (int index=0; index<NUM_TEST; index++){
  if(index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM5); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 2;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}



#define NUM6 6
void update_knn6(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM6); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 2;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}


#define NUM7 7
void update_knn7(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM7); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 3;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}


#define NUM8 8
void update_knn8(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
static int index = 0;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM8); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 3;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}


#define NUM9 9
void update_knn9(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM9); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 4;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}



#define NUM10 10
void update_knn10(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM10); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update10");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 4;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}


#define NUM11 11
void update_knn11(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM11); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }


  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();








  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update11");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 5;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}



#define NUM12 12
void update_knn12(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM12); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }

  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();



  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update12");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 5;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);




}
}


#define NUM13 13
void update_knn13(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM13); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }

  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();






  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update13");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif


   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 6;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }




   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}



#define NUM14 14
void update_knn14(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM14); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }
  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();




  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update14");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif


   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 6;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);



}
}


#define NUM15 15
void update_knn15(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM15); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }

  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();



  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update15");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 7;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}


#define NUM16 16
void update_knn16(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM16); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }

  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();





  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update16");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif


   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 7;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }



   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}



#define NUM17 17
void update_knn17(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM17); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }



  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();




  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update17");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 8;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }



   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);


}
}

#define NUM18 18
void update_knn18(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM18); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }



  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();





  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update18");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 8;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }


   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);



}
}


#define NUM19 19
void update_knn19(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<ap_uint<32> > & Output_1)
{

static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;


static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;
bit32 tmp;

for (int index=0; index<NUM_TEST; index++){
  if (index == 0)
  {
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline
			training_set[i](255, 224) =Input_1.read();
			training_set[i](223, 192) =Input_1.read();
			training_set[i](191, 160) =Input_1.read();
			training_set[i](159, 128) =Input_1.read();
			training_set[i](127,  96) =Input_1.read();
			training_set[i](95,   64) =Input_1.read();
			training_set[i](63,   32) =Input_1.read();
			training_set[i](31,    0) =Input_1.read();
	  }

	  //Transit the training sets for other pages
	  TRANSFER_LOOP: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW * (PAR_FACTOR_NEW - NUM19); i++)
	  {
#pragma HLS pipeline
			data_temp(255, 224) =Input_1.read();
			data_temp(223, 192) =Input_1.read();
			data_temp(191, 160) =Input_1.read();
			data_temp(159, 128) =Input_1.read();
			data_temp(127,  96) =Input_1.read();
			data_temp(95,   64) =Input_1.read();
			data_temp(63,   32) =Input_1.read();
			data_temp(31,    0) =Input_1.read();
			bit32 tmp;
			tmp(31, 0) = data_temp.range(255, 224);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(223, 192);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(191, 160);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(159, 128);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(127,  96);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(95,   64);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(63,   32);
			Output_1.write(tmp);
			tmp(31, 0) = data_temp.range(31,    0);
			Output_1.write(tmp);
	  }

  }

  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  tmp(31,0) = test_instance(255, 224);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(223, 192);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(191, 160);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(159, 128);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(127,  96);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(95,   64);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(63,   32);
  Output_1.write(tmp);
  tmp(31,0) = test_instance(31,    0);
  Output_1.write(tmp);

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();



  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }

#ifdef DEBUG
   printf("knn_update19");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");
#endif

   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 9;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

   bit128 output_tmp1, output_tmp2;

   for(int i=0; i<K_CONST; i++)
   {
#pragma HLS unroll
	   output_tmp1(i*32+31, i*32) = min_distance_list[i];
	   output_tmp2(i*32+31, i*32) = label_list[i];
   }

   tmp(31,0) = output_tmp1(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp1(31,  0);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(127,96);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(95, 64);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(63, 32);
   Output_1.write(tmp);
   tmp(31,0) = output_tmp2(31,  0);
   Output_1.write(tmp);

}
}



#define NUM20 20
void update_knn20(tapa::istream<ap_uint<32>>& Input_1, tapa::ostream<bit512>& Output_1)
{
static WholeDigitType training_set [NUM_TRAINING / PAR_FACTOR_NEW];
#pragma HLS array_partition variable=training_set block factor=2 dim=0

static WholeDigitType test_instance;
static unsigned char results_holder[2048];

static int knn_set[K_CONST*2];
#pragma HLS array_partition variable=knn_set complete dim=0

WholeDigitType data_temp;

for (int index=0; index<NUM_TEST; index++){
if (index == 0)
{
	  //Store the local training set
	  STORE_LOCAL: for(int i = 0; i < NUM_TRAINING / PAR_FACTOR_NEW; i++)
	  {
#pragma HLS pipeline

		training_set[i](255, 224) =Input_1.read();
		training_set[i](223, 192) =Input_1.read();
		training_set[i](191, 160) =Input_1.read();
		training_set[i](159, 128) =Input_1.read();
		training_set[i](127,  96) =Input_1.read();
		training_set[i](95,   64) =Input_1.read();
		training_set[i](63,   32) =Input_1.read();
		training_set[i](31,    0) =Input_1.read();
                //for (int j=0; j<8; j++){
                //  printf("##%d=%08x\n", i*8+j, (unsigned int) training_set[i]((7-j)*32+31, (7-j)*32));
                //}
	  }

	  //Output_1.write(2001);
}


  for(int j=255; j>0; j=j-32){
	  test_instance(j, j-31) =Input_1.read();
  }

  /*
  test_instance(255, 224) = Input_1.read();
  test_instance(223, 192) = Input_1.read();
  test_instance(191, 160) = Input_1.read();
  test_instance(159, 128) = Input_1.read();
  test_instance(127,  96) = Input_1.read();
  test_instance(95,   64) = Input_1.read();
  test_instance(63,   32) = Input_1.read();
  test_instance(31,    0) = Input_1.read();
  */
  //Output_1.write(test_instance(255, 128));
  //Output_1.write(test_instance(127, 0));

  int min_distance_list[K_CONST];
  int label_list[K_CONST];

  bit128 input_tmp1, input_tmp2;

  for(int j=127; j>0; j=j-32){
	  input_tmp1(j,  j-31) = Input_1.read();
  }
  /*
  input_tmp1(127,  96) = Input_1.read();
  input_tmp1(95,   64) = Input_1.read();
  input_tmp1(63,   32) = Input_1.read();
  input_tmp1(31,    0) = Input_1.read();
  */

  for(int j=127; j>0; j=j-32){
	  input_tmp2(j,  j-31) = Input_1.read();
  }
  /*
  input_tmp2(127,  96) = Input_1.read();
  input_tmp2(95,   64) = Input_1.read();
  input_tmp2(63,   32) = Input_1.read();
  input_tmp2(31,    0) = Input_1.read();
*/

  for(int i=0; i<K_CONST; i++)
  {
#pragma HLS unroll
	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  }

  // Initialize the knn set
   SET_KNN_SET: for ( int i = 0; i < K_CONST * 2 ; ++i )
   {
#pragma HLS unroll
     // Note that the max distance is 256
     knn_set[i] = 256;
   }

   TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING / PAR_FACTOR; ++i )
   {
       #pragma HLS pipeline
       LANES : for ( int j = 0; j < 2; j++ )
       {
         #pragma HLS unroll
         WholeDigitType training_instance = training_set[j * NUM_TRAINING / PAR_FACTOR + i];
         update_knn( test_instance, training_instance, &knn_set[j * K_CONST] );
       }
   }


   //update min_distance_list and label_list according to the new knn_set
   LabelType label_in = 9;
   knn_vote_small(knn_set, min_distance_list, label_list, label_in);

#ifdef DEBUG
   printf("knn_update20");
   for(int i=0; i<6; i++){
   	printf("knn_set[%d]=%d,", i, knn_set[i]);
   }
   printf("\n");

   printf("lable_list\n");
  	for(int i=0; i<K_CONST; i++)
  	{
  #pragma HLS unroll
  	  label_list[i] = (int) input_tmp2(i*32+31, i*32);
  	  printf("%d,", label_list[i]);
      }
  	printf("\n");

  	printf("min_distance_list\n");
  	for(int i=0; i<K_CONST; i++)
  	{
  #pragma HLS unroll
  	  min_distance_list[i] = (int) input_tmp1(i*32+31, i*32);
  	  printf("%d,", min_distance_list[i]);
      }
  	printf("\n");
#endif


  LabelType result = knn_vote_final(label_list);


  results_holder[index] = result;
}
  bit512 out_tmp;
  for(int i=0; i<NUM_TEST; i++){
    #pragma HLS pipeline II=1
    out_tmp = results_holder[i];
    Output_1 << out_tmp;
  }

}

void read_mem1(tapa::mmap<bit512> mem_in, tapa::ostream<bit512>& stream_out) {

  for (int i = 0; i < INPUT_SIZE; i++) {
      stream_out << mem_in[i];
  }
}

void read_mem(tapa::async_mmap<bit512> &mem_in, tapa::ostream<bit512>& stream_out) {
  bit512 cur_load;
  for (int i_req = 0, i_resp = 0; i_resp < INPUT_SIZE; ){
    #pragma HLS PIPELINE II=1
    if (i_req < INPUT_SIZE && mem_in.read_addr.try_write(i_req)) {
      ++i_req;
    }

    if(!mem_in.read_data.empty()) {
      cur_load = mem_in.read_data.read(nullptr);
      stream_out.write(cur_load);
      ++i_resp;
    }
  }
}

void write_mem(tapa::istream<bit512>& stream_in, tapa::mmap<bit512> mem_out) {

    for (int i = 0; i < OUTPUT_SIZE; i++) {
        stream_in >> mem_out[i];
    }
}

void digit_recognizer(tapa::mmap<bit512> mem_in1, tapa::mmap<bit512> mem_out){

	tapa::stream<bit512>      stream_in1("input_stream_1");
	tapa::stream<ap_uint<32>> knn_out1("knn_out1");
	tapa::stream<ap_uint<32>> knn_out2("knn_out2");
	tapa::stream<ap_uint<32>> knn_out3("knn_out3");
	tapa::stream<ap_uint<32>> knn_out4("knn_out4");
	tapa::stream<ap_uint<32>> knn_out5("knn_out5");
	tapa::stream<ap_uint<32>> knn_out6("knn_out6");
	tapa::stream<ap_uint<32>> knn_out7("knn_out7");
	tapa::stream<ap_uint<32>> knn_out8("knn_out8");
	tapa::stream<ap_uint<32>> knn_out9("knn_out9");
	tapa::stream<ap_uint<32>> knn_out10("knn_out10");
	tapa::stream<ap_uint<32>> knn_out11("knn_out11");
	tapa::stream<ap_uint<32>> knn_out12("knn_out12");
	tapa::stream<ap_uint<32>> knn_out13("knn_out13");
	tapa::stream<ap_uint<32>> knn_out14("knn_out14");
	tapa::stream<ap_uint<32>> knn_out15("knn_out15");
	tapa::stream<ap_uint<32>> knn_out16("knn_out16");
	tapa::stream<ap_uint<32>> knn_out17("knn_out17");
	tapa::stream<ap_uint<32>> knn_out18("knn_out18");
	tapa::stream<ap_uint<32>> knn_out19("knn_out19");
	tapa::stream<bit512>      stream_out("output_stream");

  tapa::task()
  .invoke(read_mem  ,  mem_in1   , stream_in1)
	.invoke(update_knn1,  stream_in1, knn_out1  )
	.invoke(update_knn2,  knn_out1  , knn_out2  )
	.invoke(update_knn3,  knn_out2  , knn_out3  )
	.invoke(update_knn4,  knn_out3  , knn_out4  )
	.invoke(update_knn5,  knn_out4  , knn_out5  )
	.invoke(update_knn6,  knn_out5  , knn_out6  )
	.invoke(update_knn7,  knn_out6  , knn_out7  )
	.invoke(update_knn8,  knn_out7  , knn_out8  )
	.invoke(update_knn9,  knn_out8  , knn_out9  )
	.invoke(update_knn10, knn_out9  , knn_out10 )
	.invoke(update_knn11, knn_out10 , knn_out11 )
	.invoke(update_knn12, knn_out11 , knn_out12 )
	.invoke(update_knn13, knn_out12 , knn_out13 )
	.invoke(update_knn14, knn_out13 , knn_out14 )
	.invoke(update_knn15, knn_out14 , knn_out15 )
	.invoke(update_knn16, knn_out15 , knn_out16 )
	.invoke(update_knn17, knn_out16 , knn_out17 )
	.invoke(update_knn18, knn_out17 , knn_out18 )
	.invoke(update_knn19, knn_out18 , knn_out19 )
	.invoke(update_knn20, knn_out19 , stream_out)
	.invoke(write_mem   , stream_out, mem_out   );

}
