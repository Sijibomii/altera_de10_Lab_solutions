library ieee;
use ieee.std_logic_1164.all;

entity mux2_4to1 is
port (
		P : in std_logic;
		Q,R : in std_logic_vector(3 downto 0);
		Vm : out std_logic_vector(3 downto 0)
);
end entity mux2_4to1;

architecture bhv of mux2_4to1 is
begin
	Vm(3) <= (NOT (p) AND q(3)) OR (p AND r(3));
	Vm(2) <= (NOT (p) AND q(2)) OR (p AND r(2));
	Vm(1) <= (NOT (p) AND q(1)) OR (p AND r(1));
	Vm(0) <= (NOT (p) AND q(0)) OR (p AND r(0));
end architecture;