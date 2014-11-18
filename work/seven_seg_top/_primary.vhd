library verilog;
use verilog.vl_types.all;
entity seven_seg_top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_in5        : in     vl_logic_vector(3 downto 0);
        data_in4        : in     vl_logic_vector(3 downto 0);
        data_in3        : in     vl_logic_vector(3 downto 0);
        data_in2        : in     vl_logic_vector(3 downto 0);
        data_in1        : in     vl_logic_vector(3 downto 0);
        data_in0        : in     vl_logic_vector(3 downto 0);
        addr            : out    vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end seven_seg_top;
