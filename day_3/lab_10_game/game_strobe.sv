`include "game_config.vh"

module game_strobe # ( parameter width = 32 )
(
    input      clk,
    input      reset,
    output logic strobe
);

    logic [width - 1:0] counter;

    always_ff @ (posedge clk)
        if (reset)
        begin
            counter <= { width, 1'b0 };
            strobe  <= 1'b0;
        end
        else
        begin
            counter <= counter + 1'b1;
            strobe  <= & counter;
        end

endmodule