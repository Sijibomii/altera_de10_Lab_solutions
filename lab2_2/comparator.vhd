library ieee;
use ieee.std_logic_1164.all;

entity comparator is
port (
		in_c : in std_logic_vector(3 downto 0);
		out_c : out std_logic
);
end entity comparator;

architecture bhv of comparator is
begin
	out_c <= in_c(3) and (in_c(2) or in_c(1));
end architecture;
