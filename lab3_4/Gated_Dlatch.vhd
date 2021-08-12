LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY Gated_Dlatch IS
PORT ( D, Clk : IN STD_LOGIC ;
       Q : OUT STD_LOGIC) ;
END Gated_Dlatch ;

ARCHITECTURE Behavior OF Gated_Dlatch IS
 BEGIN
   PROCESS ( D, Clk )
 
     BEGIN
     IF Clk = '1' THEN
        Q <= D ;
     END IF ;
END PROCESS ;
END Behavior;