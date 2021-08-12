library ieee;
use ieee.std_logic_1164.all;

entity circuit_A is
port (
		Vca : in std_logic_vector(3 downto 0);
		oV : out std_logic_vector(3 downto 0)
);
end entity circuit_A;

architecture bhv of circuit_A is

begin
	oV(3) <= not Vca(3) and not Vca(2) and Vca(1);
	oV(2) <= (not Vca(3) and not Vca(2) and not Vca(1))or(Vca(3) and Vca(2) and Vca(1));
	oV(1) <= not Vca(1);
	oV(0) <= Vca(0);
end architecture;