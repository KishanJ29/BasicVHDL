library ieee;
    use ieee.std_logic_1164.all;
entity nor_gate is 
 port( x,y : IN std_logic;
     z : out std_logic);
 end nor_gate;
  architecture nor_gatearc of nor_gate is 
   begin 
       z <= x nor y;
   end nor_gatearc;

