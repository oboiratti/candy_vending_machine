library verilog;
use verilog.vl_types.all;
entity seven_seg_mux_timing_gen is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        mux_sel         : out    vl_logic_vector(2 downto 0);
        addr            : out    vl_logic_vector(5 downto 0)
    );
end seven_seg_mux_timing_gen;
