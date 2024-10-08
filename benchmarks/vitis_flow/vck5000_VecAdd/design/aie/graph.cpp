// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "graph.h"

using namespace adf;

graph_overlay my_graph;

int main(int argc, char ** argv)
{
	my_graph.init();
#if defined(__X86SIM__)
	my_graph.run(1);
#else
	my_graph.run();
#endif
	my_graph.end();
	return 0;
}
