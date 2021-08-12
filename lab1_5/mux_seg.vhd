LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_seg is
 port( 
	U : in std_logic_vector(1 downto 0);
	V : in std_logic_vector(1 downto 0);
	W : in std_logic_vector(1 downto 0);
	X : in std_logic_vector(1 downto 0);
	S : in std_logic_vector(1 downto 0);
	HEX0: out std_logic_vector(7 downto 0);
	HEX1: out std_logic_vector(7 downto 0);
	HEX2: out std_logic_vector(7 downto 0);
	HEX3: out std_logic_vector(7 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end entity mux_seg;

ARCHITECTURE beh OF mux_seg IS
signal sOut: std_logic_vector(1 downto 0) := (others=> '0');

BEGIN
dsp5 : work.two_to_one_mux(Behavior) port map(U =>U, V=>V, W=>W, X=>X, S=>S,
	C => sOut);
dsp6 : work.decoder(decode) port map(C=> sOut, HEX0=>HEX0, HEX1=>HEX1, HEX2=>HEX2
	,HEX3=>HEX3);
	process(U,V,S,W,X)
	begin
	LEDR<=S&X&W&V&U; --U&V&W&X&S;
	end process;
END ARCHITECTURE beh;


--MUX
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_to_one_mux IS
PORT ( 
	U : in std_logic_vector(1 downto 0);
	V : in std_logic_vector(1 downto 0);
	W : in std_logic_vector(1 downto 0);
	X : in std_logic_vector(1 downto 0);
	S : in std_logic_vector(1 downto 0);
	C: out std_logic_vector(1 downto 0)
);
END two_to_one_mux;

ARCHITECTURE Behavior OF two_to_one_mux IS 
signal sX, sU, sV, sW, sS, sC: std_logic_vector(1 downto 0) := (others=> '0');
BEGIN
sX<= X;
sU<= U;
sS<= S;
sW<= W;
sV<= V;
process(sS, sX, sU, sV, sW)
BEGIN
	if(sS="00") then 
		sC <= sU;
	elsif(sS="01") then
		sC<=sV;
	elsif(sS="10") then
		sC<= sW;
	else 
		sC<=sX;
	end if;
end process;
C <= sC;
END ARCHITECTURE Behavior;

-- SEVEN SEGMENT
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoder is
 port( C : in std_logic_vector(1 downto 0);
			HEX0: out std_logic_vector(7 downto 0);
			HEX1: out std_logic_vector(7 downto 0);
			HEX2: out std_logic_vector(7 downto 0);
			HEX3: out std_logic_vector(7 downto 0)
			);
end entity decoder;



ARCHITECTURE decode OF decoder IS
BEGIN
	process(C)
	begin
		case(C) is 
			when "00" => HEX3<= "10100001"; HEX2<="10000110"; 
			HEX1<="11111001"; HEX0<="11000000";
			when "01" => HEX3<= "10000110"; HEX2<="11111001"; 
			HEX1<="11000000"; HEX0<="10100001";
			when "10" => HEX3<= "11111001"; HEX2<="11000000"; 
			HEX1<="10100001"; HEX0<="10000110";
			when "11" => HEX3<= "11000000"; HEX2<="10100001"; 
			HEX1<="10000110"; HEX0<="11111001";
			when others => HEX0<= "11000000"; HEX1<="11000000"; 
			HEX2<="11000000"; HEX3<="11000000";
	end case;
	end process;
END ARCHITECTURE decode;
