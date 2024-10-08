__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

NUM = 16

with open("s0.txt", "w") as f:
    f.write(f"    1    {NUM}     0     0\n")
    f.write("    0     0     0     0\n")
    f.write("    0     0     0     0\n")
    f.write("    0     0     0     0\n")

with open("s1.txt", "w") as f:
    for i in range(NUM):
        str_out = str(i)
        f.write(f"{str_out.rjust(4)}\n")


with open("s2.txt", "w") as f:
    for i in range(NUM):
        str_out = str(i)
        f.write(f"{str_out.rjust(4)}\n")

with open("s3_exp.txt", "w") as f:
    for i in range(NUM):
        f.write(f"{i*2} \n")
