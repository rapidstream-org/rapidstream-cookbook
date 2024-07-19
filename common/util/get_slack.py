__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import argparse

# The value of WNS is 2 lines below the line that starts with "WNS(ns)"
LINE_OFFSET = 2

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i", "--input_file", help="default: input_dir", type=str, default="."
    )
    parser.add_argument(
        "-o", "--output_file", help="default: output_dir", type=str, default="."
    )

    args = parser.parse_args()
    input_file = args.input_file
    output_file = args.output_file

    if input_file != ".":
        with open(input_file, "r") as file:
            lines = file.readlines()
        lines = [line.strip() for line in lines]

    for idx, line in enumerate(lines):
        if line.startswith("WNS(ns)"):
            slack = float(lines[idx + LINE_OFFSET].split()[0])
            print(f"WNS(ns) is {slack}")
