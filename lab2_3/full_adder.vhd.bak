library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port(
		a,b,c : in std_logic;
		s,c0 : out std_logic
	);
end entity full_adder;

architecture bhv of full_adder is
signal x : std_logic;
begin
	x <= a xor b;
	s <= c xor x;
	c0 <= (NOT (x) AND b) OR (x AND c);
end architecture;