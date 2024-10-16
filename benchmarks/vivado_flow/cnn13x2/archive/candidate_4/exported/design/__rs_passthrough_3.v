// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_passthrough_3 (
    output wire __rs_passthrough_pci_express_x1_rxn,
    input wire  pci_express_x1_rxn
);



__rs_pass_through #(
    .WIDTH (1)
) __rs_passthrough_pci_express_x1_rxn_inst /**   Generated by RapidStream   **/ (
    .din  (pci_express_x1_rxn),
    .dout (__rs_passthrough_pci_express_x1_rxn)
);

endmodule  // __rs_passthrough_3
