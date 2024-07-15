__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import argparse
import json
from typing import Any
# ARCH_PATH = './src/arch/yboard.txt'
# MAX_ROW = 3


def parse_json(input_file: str) -> Any:
    # Assuming you have a JSON file named 'data.json' in the current directory
    with open(input_file, "r") as file:
        data = json.load(file)

    # Now you can work with the loaded JSON data
    return data


def get_module_to_type(input_json_file: str) -> dict[str, str]:
    module_to_type: dict[str, str] = {}
    project = parse_json(input_json_file)
    for ele in project["modules"]["module_definitions"]:
        module_to_type[ele["name"]] = ele["module_type"]

    return module_to_type


def dump_json_to_file(input_dict: dict[str, str], output_file: str) -> None:
    with open(output_file, "w") as file:
        file.write("name,module_type\n")
        for key, val in input_dict.items():
            file.write(f"{key}, {val}\n")


def get_top_name(input_json_file: str) -> Any | str:
    project = parse_json(input_json_file)
    return project["modules"]["top_name"]


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

    project = parse_json(input_file)
    dump_json_to_file(get_module_to_type(input_file), output_file)
