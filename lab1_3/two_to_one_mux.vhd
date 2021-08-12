LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_to_one_mux IS
PORT ( 
	U : std_logic_vector(1 downto 0);
	V : std_logic_vector(1 downto 0);
	W : std_logic_vector(1 downto 0);
	X : std_logic_vector(1 downto 0);
	S : std_logic_vector(1 downto 0);
	HEX1: out std_logic_vector(7 downto 0);
	LEDR0: out std_logic_vector(1 downto 0);
	Z: out std_logic_vector(7 downto 0)
);
END two_to_one_mux;

ARCHITECTURE Behavior OF two_to_one_mux IS
signal sHEX1 : std_logic_vector(7 downto 0) := (others=> '0'); 
signal sX, sU, sV, sW, sS, sM: std_logic_vector(1 downto 0) := (others=> '0');
BEGIN
sX<= X;
sU<= U;
sS<= S;
sW<= W;
sV<= V;
dsp5 : work.two_bit_to_7seg(decode) port map(in2 =>sM, out7 => sHEX1);
process(sS, sX, sU, sV, sW)
BEGIN
	if(sS="00") then 
		sM <= sU;
	elsif(sS="01") then
		sM<=sV;
	elsif(sS="10") then
		sM<= sW;
	else 
		sM<=sX;
	end if;
end process;
Z<="00000000";
LEDR0 <= sM;
HEX1 <= sHEX1;
END ARCHITECTURE Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity two_bit_to_7seg is
 port( in2 : in std_logic_vector(1 downto 0);
			out7: out std_logic_vector(7 downto 0)
			);
end entity two_bit_to_7seg;



ARCHITECTURE decode OF two_bit_to_7seg IS
BEGIN
	process(in2)
	begin
		case(in2) is 
			when "00" => out7<= "11000000";
			when "01" => out7<= "11111001";
			when "10" => out7<= "10100100";
			when "11" => out7<= "10110000";
			when others => out7<= "11000000";
	end case;
	end process;
END ARCHITECTURE decode;
