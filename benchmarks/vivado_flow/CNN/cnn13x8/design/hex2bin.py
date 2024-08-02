"""Code to convert the hex file to bin file."""

__copyright__ = """
Copyright 2024 RapidStream Design Automation, Inc.
All Rights Reserved.
"""

import struct


def run() -> None:
    """Convert hex file to bin file."""
    for port in ("a", "b", "c"):
        # Convert the hex file to bin file
        with (
            open(f"mem_{port}.bin", "wb") as fout,
            open(f"mem_{port}.hex", "r", encoding="utf-8") as fin,
        ):
            # convert the hex file to list
            hex_din = []
            for line in fin:
                hex_din.append(line.strip())

            # remove the last 2 line since it is not data:
            # Passed!
            # INFO [HLS SIM]:....
            assert hex_din[-1].startswith(
                "INFO"
            ), f"Last element ({hex_din[-1]}) is not dummy"
            hex_din.pop()
            assert hex_din[-1].startswith(
                "Passed"
            ), f"Last element ({hex_din[-1]}) is not dummy"
            hex_din.pop()

            # convert the list to a bin file
            for line in hex_din:
                # One line contains 8 BYTEs
                for i in range(8):
                    # Write 1 byte to output_file every iteration.
                    # For example, ef1383843ed73345
                    # The 8 BYTEs to be dumpped should be:
                    # 0x45, 0x33, 0xd7, 0x3e, 0x84, 0x83, 0x13, 0xef
                    d2 = f"{line[14-i*2]}{line[14-i*2+1]}"
                    i2 = int(d2, 16)
                    packed_data = struct.pack("B", i2)
                    fout.write(packed_data)


if __name__ == "__main__":
    run()
