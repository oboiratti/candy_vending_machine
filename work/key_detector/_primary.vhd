library verilog;
use verilog.vl_types.all;
entity key_detector is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sw_in           : in     vl_logic;
        sw_out          : out    vl_logic
    );
end key_detector;
