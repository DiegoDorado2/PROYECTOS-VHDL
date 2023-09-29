-- Librerias

library ieee;
use ieee.std_logic_1164.all;

-- Entidades

entity NotGate is

	port(
	
		a : in std_logic;
		
		y : out std_logic
	
	);
	
end entity;

-- Arquitectura

architecture NotGate_Arch of NotGate is

	begin

	y <= a nand a;
	
end architecture;