library ieee;
use ieee.std_logic_1164.all;

entity comparator is
port (
		Cou : in std_logic;
		Vc : in std_logic_vector(3 downto 0);
		z : out std_logic
);
end entity comparator;

architecture bhv of comparator is
begin
	z <= Cou or (Vc(3) and (Vc(2) or Vc(1)));
end architecture;
