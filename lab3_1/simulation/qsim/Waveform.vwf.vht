-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/09/2021 13:08:56"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          lab3_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab3_1_vhd_vec_tst IS
END lab3_1_vhd_vec_tst;
ARCHITECTURE lab3_1_arch OF lab3_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL R : STD_LOGIC;
SIGNAL S : STD_LOGIC;
COMPONENT lab3_1
	PORT (
	Clk : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC;
	R : IN STD_LOGIC;
	S : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lab3_1
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	Q => Q,
	R => R,
	S => S
	);

-- Clk
t_prcs_Clk: PROCESS
BEGIN
LOOP
	Clk <= '0';
	WAIT FOR 5000 ps;
	Clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 40000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clk;

-- R
t_prcs_R: PROCESS
BEGIN
LOOP
	R <= '0';
	WAIT FOR 10000 ps;
	R <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 40000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_R;

-- S
t_prcs_S: PROCESS
BEGIN
LOOP
	S <= '0';
	WAIT FOR 20000 ps;
	S <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 40000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_S;
END lab3_1_arch;
