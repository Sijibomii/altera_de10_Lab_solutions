library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity lab2_5 is
port (
		SW : in std_logic_vector(8 downto 0);
		HEX0 : out std_logic_vector(0 to 6);
		HEX1 : out std_logic_vector(0 to 6);
		HEX3 : out std_logic_vector(0 to 6);
		HEX5 : out std_logic_vector(0 to 6));
		

end entity lab2_5;


architecture bhv of lab2_5 is
component circuit_B is
port (
		zb : in stD_logic;
		Dc : out stD_logic_vector(0 to 6)
);
enD component circuit_B;
component seg_7 is
port(
		x : in std_logic_vector(3 downto 0);
		HEX :out std_logic_vector(0 to 6)
);
end component seg_7;
signal T0,S0 : std_logic_vector(4 downto 0);
signal a,b,Z0 : std_logic_vector(3 downto 0);
signal c0,c1,S1 : std_logic;
begin
	A <= SW(7 downto 4);
	B <= SW(3 downto 0);
	c0 <= SW(8);
	process(A,B,c0)
	begin
		T0 <= ('0' & A) + ('0' & B) + c0;
		if (T0 > 9) then
			Z0 <= "1010";
			c1 <= '1';
		else
			Z0 <= "0000";
			c1 <= '0';
		end if;
		S0 <= T0 - Z0;
		S1 <= c1;
	end process;
	
	seg_5 : seg_7 port map(A,HEX5);
	seg_3 : seg_7 port map(B,HEX3);
	seg_1 : circuit_B port map(S1,HEX1);
	seg_0 : seg_7 port map(S0(3 downto 0),HEX0);

end architecture;