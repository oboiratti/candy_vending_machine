library verilog;
use verilog.vl_types.all;
entity seven_seg_col_sel is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sum             : in     vl_logic_vector(7 downto 0);
        candy_sum       : in     vl_logic_vector(2 downto 0);
        data_out        : out    vl_logic_vector(3 downto 0);
        display_column  : out    vl_logic_vector(7 downto 0)
    );
end seven_seg_col_sel;
