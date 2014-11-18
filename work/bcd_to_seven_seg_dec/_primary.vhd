library verilog;
use verilog.vl_types.all;
entity bcd_to_seven_seg_dec is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end bcd_to_seven_seg_dec;
