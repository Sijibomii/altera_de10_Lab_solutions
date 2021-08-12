LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_seg_2 is
 port( 
	S : in std_logic_vector(2 downto 0);
	HEX0: out std_logic_vector(7 downto 0);
	HEX1: out std_logic_vector(7 downto 0);
	HEX2: out std_logic_vector(7 downto 0);
	HEX3: out std_logic_vector(7 downto 0);
	HEX4: out std_logic_vector(7 downto 0);
	HEX5: out std_logic_vector(7 downto 0));
end entity mux_seg_2;

ARCHITECTURE beh OF mux_seg_2 IS
signal sOut: std_logic_vector(1 downto 0) := (others=> '0');
BEGIN

  dsp6 : work.decoder(decode) port map(C=>S, HEX0=>HEX0, HEX1=>HEX1, HEX2=>HEX2, HEX3=>HEX3, HEX4=>HEX4, HEX5=>HEX5);
	process(S)
	begin
	
	end process;
END ARCHITECTURE beh;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoder is
 port( C : in std_logic_vector(2 downto 0);
			HEX0: out std_logic_vector(7 downto 0);
			HEX1: out std_logic_vector(7 downto 0);
			HEX2: out std_logic_vector(7 downto 0);
			HEX3: out std_logic_vector(7 downto 0);
			HEX4: out std_logic_vector(7 downto 0);
			HEX5: out std_logic_vector(7 downto 0)
			);
end entity decoder;


ARCHITECTURE decode OF decoder IS
BEGIN
-- d==>"10100001";
-- E=>"10000110"; 1==>"11111001"; 0==>"11000000";
	process(C)
	begin
		case(C) is 
			when "000" => HEX5<= "11111111"; HEX4<="11111111"; HEX3<="10100001"; 
			HEX2<="10000110"; HEX1<="11111001"; HEX0<="11000000"; 
			
			when "001" => HEX5<= "11111111"; HEX4<="10100001"; HEX3<="10000110";
			HEX2<="11111001";	HEX1<="11000000"; HEX0<="11111111";
			
			when "010" => HEX5<= "10100001"; HEX4<="10000110"; 
			HEX3<="11111001"; HEX2<="11000000"; HEX1<="11111111"; HEX0<="11111111";
			
			when "011" => HEX5<= "10000110"; HEX4<="11111001";
			HEX3<="11000000"; HEX2<="11111111"; HEX1<="11111111"; HEX0<="10100001";
			
			when "101" => HEX5<= "11000000"; HEX4<="11111111";
			HEX3<="11111111"; HEX2<="10100001"; HEX1<="10000110"; HEX0<="11111001";
			
			when "100" => HEX5<= "11111001"; HEX4<="11000000"; HEX3<="11111111"; HEX2<="11111111";
			HEX1<="10100001"; HEX0<="10000110";
			when others => HEX0<= "11000000"; HEX1<="11000000"; HEX2<="11000000"; HEX3<="11000000"; HEX4<="11000000"; HEX5<="11000000";
	end case;
	end process;
END ARCHITECTURE decode;