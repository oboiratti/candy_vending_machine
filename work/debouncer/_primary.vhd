library verilog;
use verilog.vl_types.all;
entity debouncer is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key_in          : in     vl_logic_vector(3 downto 0);
        key_out         : out    vl_logic_vector(3 downto 0)
    );
end debouncer;
