library ieee;
use ieee.std_logic_1164.all;

entity seg_7 is
port(
		x : in std_logic_vector(3 downto 0);
		HEX :out std_logic_vector(0 to 6)
);
end entity seg_7;

architecture Behavioral of seg_7 is
signal y : std_logic_vector(0 to 6);
begin
	y(0) <= (not(x(3)) and not(x(2)) and not (x(1)) and x(0)) or (not (x(3)) and x(2) and not (x(1)) and not (x(0)));
	y(1) <= (not x(3) and 	  x(2) and not x(1) and x(0)) or (not x(3) and x(2) and x(1) and not x(0));
	y(2) <= (not x(3) and not x(2) and 	  x(1) and not(x(0)));
	y(3) <= (not x(3) and not x(2) and not x(1) and x(0)) or (not x(3) and x(2) and not x(1) and not x(0)) or (not x(3) and x(2) and x(1) and x(0));
	y(4) <= (not x(3) and not x(2) and 	  x(0)) or (not x(3) and x(2) and not x(1)) or (not x(3) and x(2) and x(1) and x(0)) or (x(3) and not(x(2)) and not x(1) and x(0));
	y(5) <= (not x(3) and not x(2) and not x(1) and x(0)) or (not x(3) and not x(2) and x(1)) or (not x(3) and x(2) and x(1) and x(0));
	y(6) <= (not x(3) and not x(2) and not x(1)) or (not x(3) and x(2) and x(1) and x(0));
	HEX <= y;
end architecture;