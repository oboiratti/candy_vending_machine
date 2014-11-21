library verilog;
use verilog.vl_types.all;
entity keypad_map is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        row             : in     vl_logic_vector(3 downto 0);
        col             : out    vl_logic_vector(2 downto 0);
        kp_out          : out    vl_logic_vector(2 downto 0)
    );
end keypad_map;
