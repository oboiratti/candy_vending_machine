library verilog;
use verilog.vl_types.all;
entity clock_divider_1khz_to_1hz is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        clk1hz          : out    vl_logic
    );
end clock_divider_1khz_to_1hz;
