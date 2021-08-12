library ieee;
use ieee.stD_logic_1164.all;

entity decoder_1 is
port (
		in_d : in stD_logic;
		out_d : out stD_logic_vector(0 to 6)
);
end entity decoder_1;

architecture bhv of decoder_1 is
begin
		out_d(0) <= in_d;
		out_d(1) <= '0';
		out_d(2) <= '0';
		out_d(3) <= in_d;
		out_d(4) <= in_d;
		out_d(5) <= in_d;
		out_d(6) <= '1';
end architecture;