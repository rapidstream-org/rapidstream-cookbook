#!/usr/bin/env python3
__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

M = 2
K = 8
N = 64

with open("s0.txt", "w") as f:
    for row in range(1, M + 1):
        for col in range(1, K + 1):
            str_out = str(f"{row}000{col}")
            f.write(f"{str_out.rjust(4)}\n")

with open("s1.txt", "w") as f:
    for row in range(1, K + 1):
        for col in range(1, N + 1):
            str_out = str(f"{row}000{col}")
            f.write(f"{str_out.rjust(4)}\n")


with open("s2_exp.txt", "w") as f:
    for i in range(K):
        f.write(f"{i*i} \n")
