LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dlatch_f IS
PORT ( Clk, D : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END Dlatch_f;

ARCHITECTURE Structural OF Dlatch_f IS
SIGNAL R,S,R_g, S_g, Qa, Qb : STD_LOGIC ;
ATTRIBUTE KEEP : BOOLEAN;
ATTRIBUTE KEEP OF R, R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN
S <= D;
R <= NOT D;
R_g <= NOT( R AND Clk);
S_g <= NOT( S AND Clk);
Qa <= NOT (S_g AND Qb);
Qb <= NOT (R_g AND Qa);
Q <= Qa;
END Structural;