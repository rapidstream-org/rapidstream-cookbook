#!/usr/bin/env python3
__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

NUM = 256

# with open("s0.txt", "w") as f:
#    f.write(f"    1    {NUM}     0     0\n")
#    f.write("    0     0     0     0\n")
#    f.write("    0     0     0     0\n")
#    f.write("    0     0     0     0\n")

with open("s0.txt", "w") as f:
    for i in range(NUM):
        for j in range(4):
            f.write(f"{i*4+j} ")
            f.write("\n")

with open("s1.txt", "w") as f:
    for i in range(NUM):
        for j in range(4):
            f.write(f"{i*4+j} ")
            f.write("\n")


with open("s2_exp.txt", "w") as f:
    for i in range(NUM):
        f.write(f"{i+i} \n")
