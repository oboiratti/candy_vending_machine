library verilog;
use verilog.vl_types.all;
entity clock_divider_1khz_to_1hz_tb is
    generic(
        clk_period      : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clk_period : constant is 1;
end clock_divider_1khz_to_1hz_tb;
