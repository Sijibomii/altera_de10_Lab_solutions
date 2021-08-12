library ieee;
use ieee.stD_logic_1164.all;

entity circuit_B is
port (
		zb : in stD_logic;
		Dc : out stD_logic_vector(0 to 6)
);
enD entity circuit_B;

architecture bhv of circuit_B is
begin
		Dc(0) <= zb;
		Dc(1) <= '0';
		Dc(2) <= '0';
		Dc(3) <= zb;
		Dc(4) <= zb;
		Dc(5) <= zb;
		Dc(6) <= '1';
enD architecture;