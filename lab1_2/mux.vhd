LIBRARY ieee;

USE ieee.std_logic_1164.all;

entity mux is
 port( X,Y: in std_logic_vector(3 downto 0);
			S: in std_logic;
			HEX1: out std_logic_vector(7 downto 0);
			LEDR0: out std_logic_vector(9 downto 0);
			Z: out std_logic_vector(4 downto 0);
			LEDR1: out std_logic
			);
end entity mux;


-- Display the value of the input s on LEDR9,
--connect the output M to LEDR3−0, 
--and connect the unused LEDR lights to the constant value 0.

ARCHITECTURE MUX_Behavior OF mux IS
signal sHEX1 : std_logic_vector(7 downto 0) := (others=> '0'); 
signal sX, sY, sM : std_logic_vector(3 downto 0) := (others=> '0');
signal sS : std_logic;
BEGIN
sX<= X;
sY<= Y;
sS<= S;

 dsp5 : work.four_bit_to_7seg(decode) port map(in4 =>sM, out7 => sHEX1);
process(sS, sX, sY)
BEGIN
	if(s='0') then -- output should be X
		sM <= sX;
	else
		sM<=sY;
	end if;
end process;
Z<="00000";
LEDR1 <= sS;
LEDR0 <= "0000000000";
HEX1 <= sHEX1;
END ARCHITECTURE MUX_Behavior;

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
			when "0101" => out7<= "10010011";
			when "0110" => out7<= "10000010";
			when "0111" => out7<= "11111000";
			when "1000" => out7<= "10000000";
			when "1111" => out7<= "10010000";
			when others => out7<= "11000000";
	end case;
	end process;
END ARCHITECTURE decode;
