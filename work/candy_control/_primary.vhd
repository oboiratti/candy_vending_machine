library verilog;
use verilog.vl_types.all;
entity candy_control is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        candy           : out    vl_logic;
        change_beg      : out    vl_logic_vector(2 downto 0);
        change_obeg     : out    vl_logic;
        sum             : out    vl_logic_vector(7 downto 0);
        candy_sum       : out    vl_logic_vector(2 downto 0)
    );
end candy_control;
