library verilog;
use verilog.vl_types.all;
entity candy_top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key_in          : in     vl_logic_vector(5 downto 0);
        candy           : out    vl_logic;
        change_beg      : out    vl_logic_vector(2 downto 0);
        change_obeg     : out    vl_logic;
        addr            : out    vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end candy_top;
