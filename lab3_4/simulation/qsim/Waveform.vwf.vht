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
-- Generated on "08/09/2021 13:27:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          lab3_4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab3_4_vhd_vec_tst IS
END lab3_4_vhd_vec_tst;
ARCHITECTURE lab3_4_arch OF lab3_4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Qa : STD_LOGIC;
SIGNAL Qb : STD_LOGIC;
SIGNAL Qc : STD_LOGIC;
COMPONENT lab3_4
	PORT (
	Clk : IN STD_LOGIC;
	D : IN STD_LOGIC;
	Qa : BUFFER STD_LOGIC;
	Qb : BUFFER STD_LOGIC;
	Qc : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lab3_4
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	D => D,
	Qa => Qa,
	Qb => Qb,
	Qc => Qc
	);

-- Clk
t_prcs_Clk: PROCESS
BEGIN
LOOP
	Clk <= '0';
	WAIT FOR 5000 ps;
	Clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clk;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 49
	LOOP
		D <= '0';
		WAIT FOR 10000 ps;
		D <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;
END lab3_4_arch;
