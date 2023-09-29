library	IEEE;
use IEEE.std_logic_1164.all;

-- Entity (empty)
entity FullAdder_test is	
end entity;

-- Architecture (test process)
architecture arch_test of FullAdder_test is

-- Component declaration
component FullAdder
	port(
		a		:	in 	std_logic;
		b		:	in		std_logic;
		c     : in     std_logic;
		sum	:	out 	std_logic;
		carry :	out	std_logic
	);
end component;
	
-- Signal declaration
signal a_test			: std_logic := '0';
signal b_test			: std_logic := '0';
signal c_test			: std_logic := '0';
signal sum_test		: std_logic;
signal carry_test		: std_logic;
	
begin
	
-- DUT instantiation
dut1	: FullAdder 
	port map (
		a 		=> a_test,
		b 		=> b_test,
		c     => c_test,
		sum 	=> sum_test,
		carry	=> carry_test
	);

-- Stimulus generation
Stimulus	: process
begin
	  
   report "Start of the test of FullAdder"	  
	severity note;
		
	a_test 	<= '0';
	b_test 	<= '0';	
   c_test   <= '0';	
	
	wait for 1 ns;
	assert sum_test = '0' and carry_test = '0'
	  report "Failure for {a,b,c} = {0,0,0}"
	  severity failure;
	
	a_test 	<= '0';
	b_test 	<= '0';	
   c_test   <= '1';	
	wait for 1 ns;
	assert sum_test = '1' and carry_test = '0'
	  report "Failure for {a,b,c} = {0,0,1}"
	  severity failure;
		
	a_test 	<= '0';
	b_test 	<= '1';	
   c_test   <= '0';
		
	wait for 1 ns;
	assert sum_test = '1' and carry_test = '0'
	  report "Failure for {a,b,c} = {0,1,0}"
	  severity failure;
		
	a_test 	<= '0';
	b_test 	<= '1';	
   c_test   <= '1';	
	wait for 1 ns;
	assert sum_test = '0' and carry_test = '1'
	  report "Failure for {a,b,c} = {0,1,1}"
	  severity failure;
	  
	a_test 	<= '1';
	b_test 	<= '0';	
   c_test   <= '0';	
	wait for 1 ns;
	assert sum_test = '1' and carry_test = '0'
	  report "Failure for {a,b,c} = {1,0,0}"
	  severity failure;
		  
	a_test 	<= '1';
	b_test 	<= '0';	
   c_test   <= '1';	
	wait for 1 ns;
	assert sum_test = '0' and carry_test = '1'
	  report "Failure for {a,b,c} = {1,0,1}"
	  severity failure;
		  
	a_test 	<= '1';
	b_test 	<= '1';	
   c_test   <= '0';	
	wait for 1 ns;
	assert sum_test = '0' and carry_test = '1'
	  report "Failure for {a,b,c} = {1,1,0}"
	  severity failure;
		  
	a_test 	<= '1';
	b_test 	<= '1';	
   c_test   <= '1';	
	wait for 1 ns;
	assert sum_test = '1' and carry_test = '1'
	  report "Failure for {a,b,c} = {1,1,1}"
	  severity failure;
		  

	report "Test successful"
	severity note;
	wait;
		
end process;

end architecture;