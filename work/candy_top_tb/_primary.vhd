library verilog;
use verilog.vl_types.all;
entity candy_top_tb is
    generic(
        clk_period      : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clk_period : constant is 1;
end candy_top_tb;