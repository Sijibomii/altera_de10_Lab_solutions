library ieee;
use ieee.std_logic_1164.all;

entity mux_4 is
port (
		a : in std_logic;
		b,c : in std_logic_vector(3 downto 0);
		Z : out std_logic_vector(3 downto 0)
);
end entity mux_4;

architecture bhv of mux_4 is
begin
	Z(3) <= (NOT (a) AND b(3)) OR (a AND c(3));
	Z(2) <= (NOT (a) AND b(2)) OR (a AND c(2));
	Z(1) <= (NOT (a) AND b(1)) OR (a AND c(1));
	Z(0) <= (NOT (a) AND b(0)) OR (a AND c(0));
end architecture;