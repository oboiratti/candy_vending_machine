library verilog;
use verilog.vl_types.all;
entity key_map is
    port(
        key_in          : in     vl_logic_vector(5 downto 0);
        key_out         : out    vl_logic_vector(2 downto 0)
    );
end key_map;
