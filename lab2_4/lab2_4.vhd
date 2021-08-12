library ieee;
use ieee.std_logic_1164.all;

entity lab2_4 is
port (
		SW : in std_logic_vector(8 downto 0);
		HEX0 : out std_logic_vector(0 to 6);
		HEX1 : out std_logic_vector(0 to 6);
		HEX3 : out std_logic_vector(0 to 6);
		HEX5 : out std_logic_vector(0 to 6);
		LEDR : out std_logic_vector(9 downto 9));
end entity lab2_4;


architecture bhv of lab2_4 is
component seg_7 is
port(
		x : in std_logic_vector(3 downto 0);
		HEX :out std_logic_vector(0 to 6));
end component seg_7;

component circuit_B is
port (
		zb : in stD_logic;
		Dc : out stD_logic_vector(0 to 6)
);
enD component circuit_B;

component comparator is
port (
		Cou : in std_logic;
		Vc : in std_logic_vector(3 downto 0);
		z : out std_logic
);
end component comparator;

component circuit_A is
port (
		Vca : in std_logic_vector(3 downto 0);
		oV : out std_logic_vector(3 downto 0)
);
end component circuit_A;

component mux2_4to1 is
port (
		P : in std_logic;
		Q,R : in std_logic_vector(3 downto 0);
		Vm : out std_logic_vector(3 downto 0)
);
end component mux2_4to1;
component full_adder is
port(
		a,b,c : in std_logic;
		s,c0 : out std_logic
	);
end component full_adder;
signal Su,Voca,Vmo: std_logic_vector(3 downto 0);
signal C1,C2,C3,Cout,zcom,x_er,y_er : std_logic;
begin
	F0 : full_adder port map (SW(4) , SW(0) , SW(8) , Su(0) , C1);
	F1 : full_adder port map (SW(5) , SW(1) , C1 , Su(1) , C2);
	F2 : full_adder port map (SW(6) , SW(2) , C2 , Su(2) , C3);
	F3 : full_adder port map (SW(7) , SW(3) , C3 , Su(3) , Cout);
	circ_A : circuit_A port map (Su,Voca);
	comp : comparator port map (Cout,Su,zcom);
	comp1 : comparator port map ('0',SW(3 downto 0),x_er);
	comp2 : comparator port map ('0',SW(7 downto 4),y_er);
	circ_B : circuit_B port map (zcom,HEX1);
	mux : mux2_4to1 port map (zcom,Su,Voca,Vmo);
	seg0 : seg_7 port map (Vmo,HEX0);
	seg3 : seg_7 port map (SW(3 downto 0),HEX3);
	seg5 : seg_7 port map (SW(7 downto 4),HEX5);
	LEDR(9) <= x_er or y_er;
end architecture;