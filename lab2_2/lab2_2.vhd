library ieee;
use ieee.std_logic_1164.all;

entity lab2_2 is
port (
		SW : in std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(0 to 6);
		HEX1 : out std_logic_vector(0 to 6));

end entity lab2_2;

architecture beh of lab2_2 is
component seg_7 is
port(
		x : in std_logic_vector(3 downto 0);
		HEX :out std_logic_vector(0 to 6));
end component seg_7;
component decoder_1 is
port (
		in_d : in stD_logic;
		out_d : out stD_logic_vector(0 to 6)
);
end component decoder_1;
component comparator is
port (
		in_c : in std_logic_vector(3 downto 0);
		out_c : out std_logic
);
end component comparator;
component circuit_A is
port (
		in_a : in std_logic_vector(3 downto 0);
		out_a : out std_logic_vector(3 downto 0)
);
end component circuit_A;
component mux_4 is
port (
		a : in std_logic;
		b,c : in std_logic_vector(3 downto 0);
		Z : out std_logic_vector(3 downto 0)
);
end component mux_4;
Signal v,w :  std_logic_vector(3 downto 0);
signal y : std_logic;
signal p : std_logic_vector(0 to 6);
begin
	circ_A : circuit_A port map (SW,v);
	comp : comparator port map (SW,y);
	decoder : decoder_1 port map (y,p);
	mux_4_2 : mux_4 port map (y,SW,v,w);
	seg0 : seg_7 port map (w,HEX0);
	HEX1 <= p;
end architecture beh;
