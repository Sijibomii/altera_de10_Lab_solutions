LIBRARY ieee;

USE ieee.std_logic_1164.all;

entity mux is
 port( X,Y: in std_logic_vector(3 downto 0);
			S: in std_logic;
			M: out std_logic_vector(3 downto 0);
			HEX0, HEX1: out std_logic_vector(7 downto 0)
			);
end entity mux;


-- Display the value of the input s on LEDR9,
--connect the output M to LEDR3−0, 
--and connect the unused LEDR lights to the constant value 0.

ARCHITECTURE MUX_Behavior OF mux IS
signal sHEX0, sHEX1 : std_logic_vector(7 downto 0) := (others=> '0'); 
signal sX, sY, sM : std_logic_vector(3 downto 0) := (others=> '0');
signal sS : std_logic;
BEGIN
sX<= X;
sY<= Y;
sS<= S;

dsp3_0 : work.four_bit_to_7seg(decode) port map(in4 =>sM, out7 => sHEX0);
dsp9 : work.four_bit_to_7seg(decode) port map(in4 =>("000"&sS), out7 => sHEX0);
process(sS)
BEGIN
	if(s='0') then -- output should be X
		sM <= sX;
	else
		sM<=sY;
	end if;
end process;
M <= sM;
HEX1 <= sHEX1;
HEX0 <= sHEX0;
END MUX_Behavior;

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
	--7-0
		case(in4) is 
			when "0000" => out7<= "00000000";
			when "0001" => out7<= "00000110";
			when "0010" => out7<= "01011011";
			when "0011" => out7<= "01001110";
			when "0100" => out7<= "01100110";
			when "0101" => out7<= "01101100";
			when "0110" => out7<= "01111101";
			when "0111" => out7<= "00000111";
			when "1111" => out7<= "01111111";
	end case;
	end process;
END decode;
