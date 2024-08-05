__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import argparse
import json
import re


def get_global_slack(lines: list[str]) -> str | None:
    """Get the global slack value from the lines of the report file."""
    # The value of WNS is 2 lines below the line that starts with "WNS(ns)"
    num_line_offset = 2

    # Grab the slack value
    for idx, line in enumerate(lines):
        if line.startswith("WNS(ns)"):
            slack = float(lines[idx + num_line_offset].split()[0])
            return str(slack)
    return None


def get_target_clk_slack(lines: list[str], target_clk: str) -> str | None:
    """Get the slack value for a specific target clock from the lines of the report file."""

    # Assume Worsk Slack is 3 lines below the line that starts with "From Clock"
    slack_line_offset = 3

    # Grab the slack value
    for idx, line in enumerate(lines):
        # current line
        matched1 = re.match(rf"^From Clock:\s*{target_clk}", line)
        # next line
        matched2 = re.match(rf"^To Clock:\s*{target_clk}", lines[idx + 1])
        if matched1 and matched2:
            matched3 = re.search(
                r"Worst Slack\s*([\d.]+)ns", lines[idx + slack_line_offset]
            )
            if matched3:
                return str(matched3.group(1))

    return None


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i", "--input_file", help="default: input_dir", type=str, default="."
    )
    parser.add_argument(
        "-o", "--output_file", help="default: output_dir", type=str, default="."
    )
    parser.add_argument(
        "-c", "--clk_name", help="default: target clk name", type=str, default=None
    )
    parser.add_argument(
        "-p", "--clk_period_ns", help="default: clk in ns", type=str, default=None
    )

    args = parser.parse_args()
    input_file = args.input_file
    output_file = args.output_file
    clk_name = args.clk_name
    clk_ns = args.clk_period_ns
    results: dict[str, str | None] = {}

    if input_file != ".":
        with open(input_file, "r") as ifile:
            lines = ifile.readlines()
        lines = [line.strip() for line in lines]

    results["global_slack"] = get_global_slack(lines)
    if clk_name is not None:
        results["target_clk_slack"] = get_target_clk_slack(lines, clk_name)
        if clk_ns is not None and results["target_clk_slack"] is not None:
            results["target_clk"] = f"{clk_ns}ns"
            results["frequency_achieved"] = (
                f"{1000 / (float(clk_ns) - float(results['target_clk_slack'])):.2f} MHz"
            )

    if input_file != ".":
        with open(output_file, "w") as ofile:
            json.dump(results, ofile, indent=4)
