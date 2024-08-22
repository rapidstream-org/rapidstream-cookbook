__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import argparse
import json
import re
from glob import glob


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
        if re.match(rf"^From Clock:\s*{target_clk}", line):
            # Next line should be "To Clock"
            matched1 = re.match(rf"^To Clock:\s*{target_clk}", lines[idx + 1])
            # Previous line should not contain async_default""
            matched2 = re.match(r"Path Group.*async_default", lines[idx - 1])
            if matched1 and not matched2:
                matched3 = re.search(
                    r"Worst Slack\s*([-\d.]+)ns", lines[idx + slack_line_offset]
                )
                if matched3:
                    return str(matched3.group(1))

    return None


def update_slack(
    timing_rpt: str, results: dict[str, str | None], clk_name: str, clk_ns: str
) -> None:
    """Update the slack values in the results dictionary."""

    # Get the candidate num
    matched = re.search(r"candidate_([\d.]+)", timing_rpt)
    if matched:
        freq_key = f"candidate_{str(matched.group(1))}"
    else:
        freq_key = timing_rpt

    with open(timing_rpt, "r") as ifile:
        lines = ifile.readlines()
    lines = [line.strip() for line in lines]

    results[f"{freq_key}_global_slack"] = get_global_slack(lines)
    if clk_name is not None:
        slack = get_target_clk_slack(lines, clk_name)
        results[f"{freq_key}_target_clk_slack"] = slack
        if clk_ns is not None and slack is not None:
            results[f"{freq_key}_target_clk"] = f"{clk_ns}ns"
            results[f"{freq_key}_frequency_achieved"] = (
                f"{1000 / (float(clk_ns) - float(slack)):.2f} MHz"
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i", "--input_file", help="default: input_dir", type=str, default="."
    )

    parser.add_argument(
        "-d", "--search_dir", help="default: search directory", type=str, default="."
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
    search_dir = args.search_dir
    output_file = args.output_file
    clk_name = args.clk_name
    clk_ns = args.clk_period_ns
    results: dict[str, str | None] = {}

    if search_dir != "." and input_file != ".":
        timing_rpts = glob(f"{search_dir}/**/{input_file}", recursive=True)
        for timing_rpt in timing_rpts:
            update_slack(timing_rpt, results, clk_name, clk_ns)
            if output_file != ".":
                with open(output_file, "w") as ofile:
                    json.dump(results, ofile, indent=4)
