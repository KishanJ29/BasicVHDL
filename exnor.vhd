library ieee;
    use ieee.std_logic_1164.all;
entity exnor_gate is 
 port( x,y : IN std_logic;
     z : out std_logic);
 end exnor_gate;
  architecture exnor_gatearc of exnor_gate is 
   begin 
       z <= x xnor y;
   end exnor_gatearc;
