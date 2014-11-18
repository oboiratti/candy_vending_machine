library verilog;
use verilog.vl_types.all;
entity seven_seg_mux is
    port(
        data_in5        : in     vl_logic_vector(3 downto 0);
        data_in4        : in     vl_logic_vector(3 downto 0);
        data_in3        : in     vl_logic_vector(3 downto 0);
        data_in2        : in     vl_logic_vector(3 downto 0);
        data_in1        : in     vl_logic_vector(3 downto 0);
        data_in0        : in     vl_logic_vector(3 downto 0);
        mux_sel         : in     vl_logic_vector(2 downto 0);
        data_out        : out    vl_logic_vector(3 downto 0)
    );
end seven_seg_mux;
