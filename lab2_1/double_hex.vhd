LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY double_hex IS
PORT ( 
	U : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	HEX0: out std_logic_vector(7 downto 0);
	HEX1: out std_logic_vector(7 downto 0)
);
END double_hex;

ARCHITECTURE beh OF double_hex IS
BEGIN
	 seg0 : work.four_bit_to_7seg(decode) port map(in4 =>U, out7 => HEX0);--U(SW3-0)
	 seg1 : work.four_bit_to_7seg(decode) port map(in4 =>V, out7 => HEX1);
END ARCHITECTURE beh;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity four_bit_to_7seg is
 port( in4 : in std_logic_vector(3 downto 0);
			out7: out std_logic_vector(7 downto 0)
			);
end entity four_bit_to_7seg;


ARCHITECTURE decode OF four_bit_to_7seg IS
BEGIN
	process(in4)
	begin
		case(in4) is 
			when "0000" => out7<= "11000000";
			when "0001" => out7<= "11111001";
			when "0010" => out7<= "10100100";
			when "0011" => out7<= "10110000";
			when "0100" => out7<= "10011001";
			when "0101" => out7<= "10010010";
			when "0110" => out7<= "10000010";
			when "0111" => out7<= "11111000";
			when "1000" => out7<= "10000000";
			when "1001" => out7<= "10010000";
			when others => out7<= "10000110";
	end case;
	end process;
END ARCHITECTURE decode;
