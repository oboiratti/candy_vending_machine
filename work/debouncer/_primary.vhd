library verilog;
use verilog.vl_types.all;
entity debouncer is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        keyin           : in     vl_logic_vector(2 downto 0);
        keyout          : out    vl_logic_vector(2 downto 0)
    );
end debouncer;
