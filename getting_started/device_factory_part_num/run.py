"""Getting Started: Device Factory for Vivado Parts

This this demo, we present the method to manually define and integrate
the Versal Premium VP 1552 device part into our framework.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import DeviceFactory

# With `DeviceFactory`, split the `xcvp1552-vsva3340-2MHP-i-S` part into
# 4 rows and 2 columns:
factory = DeviceFactory(
    row=4,
    col=2,
    part_num="xcvp1552-vsva3340-2MHP-i-S",
)

# Set the pblocks of the device so that each slot contains half of an SLR:
factory.set_slot_pblock(0, 0, ["-add CLOCKREGION_X1Y1:CLOCKREGION_X4Y2"])
factory.set_slot_pblock(1, 0, ["-add CLOCKREGION_X5Y1:CLOCKREGION_X9Y2"])
factory.set_slot_pblock(0, 1, ["-add CLOCKREGION_X1Y3:CLOCKREGION_X4Y4"])
factory.set_slot_pblock(1, 1, ["-add CLOCKREGION_X5Y3:CLOCKREGION_X9Y4"])

factory.set_slot_pblock(0, 2, ["-add CLOCKREGION_X1Y5:CLOCKREGION_X4Y6"])
factory.set_slot_pblock(1, 2, ["-add CLOCKREGION_X5Y5:CLOCKREGION_X9Y6"])
factory.set_slot_pblock(0, 3, ["-add CLOCKREGION_X1Y7:CLOCKREGION_X4Y7"])
factory.set_slot_pblock(1, 3, ["-add CLOCKREGION_X5Y7:CLOCKREGION_X9Y7"])

# There are 18870 total SLL nodes for VP1552:
factory.set_slot_crossing_capacity(0, 1, north=9435)
factory.set_slot_crossing_capacity(1, 1, north=9435)

# Call factory to extract the slot resources automatically from Vivado:
factory.extract_slot_resources()

# The device can be supplied as the virtual device for the RapidStream APIs:
device = factory.generate_virtual_device()
# rs.set_virtual_device(device)
