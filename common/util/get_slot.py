__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import argparse
import json
import re
from glob import glob
from typing import Any, Dict

# ARCH_PATH = './src/arch/yboard.txt'
# MAX_ROW = 3


def parse_json(input_file: str) -> Dict[str, Any]:
    # Assuming you have a JSON file named 'data.json' in the current directory
    data: Dict[str, Any] = {}
    with open(input_file, "r") as file:
        data = json.load(file)

    # Now you can work with the loaded JSON data
    return data


def all_ports_pipelinable(project: Dict[str, Any], module_name: str) -> str:
    pipeline_type = [
        "handshake",
        "clock",
        "ff_reset",
        "feed_forward",
        "false_path",
        "ap_ctrl",
    ]
    unpipeline_type = ""
    if module_name not in project["ifaces"]:
        unpipeline_type = "no_interface"
    for ifc in project["ifaces"][module_name]:
        if ifc["type"] not in pipeline_type:
            unpipeline_type += ifc["type"] + ":"

    return unpipeline_type


def get_dict_helper(
    input_json_file: str, top_module: str, feature: str
) -> Dict[str, Any]:
    inst_to_feature = {}
    project = parse_json(input_json_file)
    for ele in project["modules"]["module_definitions"]:
        if ele["name"] == top_module:
            for sub_ele in ele["submodules"]:
                inst_to_feature[sub_ele["name"]] = sub_ele[feature]
    return inst_to_feature


def get_iface_dict(input_json_file: str, top_name: str) -> Dict[str, Any]:
    inst_to_feature = {}
    project = parse_json(input_json_file)
    for ele in project["modules"]["module_definitions"]:
        if ele["name"] == top_name:
            for sub_ele in ele["submodules"]:
                inst_to_feature[sub_ele["name"]] = all_ports_pipelinable(
                    project, sub_ele["module"]
                )

    return inst_to_feature


def get_area_dict(input_json_file: str, top_name: str) -> Dict[str, Any]:
    return get_dict_helper(input_json_file, top_name, "area")


def get_floorplan_dict(input_json_file: str, top_name: str) -> Dict[str, Any]:
    return get_dict_helper(input_json_file, top_name, "floorplan_region")


def get_area_and_floorplan_iface_dict(
    input_json_file: str, top_name: str
) -> Dict[str, Any]:
    area_dict = get_area_dict(input_json_file, top_name)
    iface_dict = get_iface_dict(input_json_file, top_name)
    floorplan_dict = get_floorplan_dict(input_json_file, top_name)
    merged_dict = {}
    for key in area_dict:
        area_dict[key]["floorplan"] = floorplan_dict[key]
        area_dict[key]["iface"] = iface_dict[key]
        merged_dict[key] = area_dict[key]

    return merged_dict


def dump_json_to_file(input_dict: Dict[str, Any], output_file: str) -> None:
    with open(output_file, "w") as file:
        file.write("name,floorplan,ff,lut,bram_18k,dsp,uram,unpipelinable\n")
        for key in input_dict:
            file.write(key + ",")
            file.write(str(input_dict[key]["floorplan"]) + ",")
            file.write(str(input_dict[key]["ff"]) + ",")
            file.write(str(input_dict[key]["lut"]) + ",")
            file.write(str(input_dict[key]["bram_18k"]) + ",")
            file.write(str(input_dict[key]["dsp"]) + ",")
            file.write(str(input_dict[key]["uram"]) + ",")
            file.write(str(input_dict[key]["iface"]) + "\n")


def get_x_y(slot: str) -> tuple[int, int]:
    numbers = re.findall(r"\d+", slot)
    return int(numbers[0]), int(numbers[1])


def get_max_x_y(slots_area_table: Dict[str, Any]) -> tuple[int, int]:
    max_x = 0
    max_y = 0
    for key in slots_area_table:
        x, y = get_x_y(key)
        if x > max_x:
            max_x = x
        if y > max_y:
            max_y = y
    return max_x, max_y


def get_top_name(input_json_file: str) -> str:
    project = parse_json(input_json_file)
    return str(project["modules"]["top_name"])


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i", "--in_dir", help="default: input_dir", type=str, default="."
    )

    parser.add_argument(
        "-o", "--out_dir", help="default: output_dir", type=str, default="."
    )

    args = parser.parse_args()
    in_dir = args.in_dir
    out_dir = args.out_dir

    input_files = glob(f"{in_dir}/**/dse/solution_*/autobridge.json", recursive=True)

    for input_file in input_files:
        match = re.search(r"(solution_\d+)", input_file)
        if match:
            candidate = match.group(1)
            print(f"Processing {candidate}....")
            top_name = get_top_name(input_file)
            data_table = get_area_and_floorplan_iface_dict(input_file, top_name)
            slots = set([data_table[key]["floorplan"] for key in data_table])
            slots_area_table = {}
            for slot in slots:
                slots_area_table[slot] = {
                    "ff": 0,
                    "lut": 0,
                    "bram_18k": 0,
                    "dsp": 0,
                    "uram": 0,
                }

            for key, value in data_table.items():
                slot = value["floorplan"]
                slots_area_table[slot]["ff"] += value["ff"]
                slots_area_table[slot]["lut"] += value["lut"]
                slots_area_table[slot]["bram_18k"] += value["bram_18k"]
                slots_area_table[slot]["dsp"] += value["dsp"]
                slots_area_table[slot]["uram"] += value["uram"]

            dump_json_to_file(data_table, f"{out_dir}/floorplan_{candidate}.csv")
