library ieee;
use ieee.std_logic_1164.all;

entity circuit_A is
port (
		in_a : in std_logic_vector(3 downto 0);
		out_a : out std_logic_vector(3 downto 0)
);
end entity circuit_A;

architecture bhv of circuit_A is

begin
	out_a(3) <= not in_a(3);
	out_a(2) <= in_a(3) and in_a(2) and in_a(1);
	out_a(1) <= not in_a(1);
	out_a(0) <= in_a(0);
end architecture;