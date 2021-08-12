LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoder is
 port( C : in std_logic_vector(1 downto 0);
			HEX0: out std_logic_vector(7 downto 0)
			);
end entity decoder;



ARCHITECTURE decode OF decoder IS
BEGIN
	process(C)
	begin
		case(C) is 
			when "00" => HEX0<= "10100001";
			when "01" => HEX0<= "10000110";
			when "10" => HEX0<= "11111001";
			when "11" => HEX0<= "11000000";
			when others => HEX0<= "11000000";
	end case;
	end process;
END ARCHITECTURE decode;
