library ieee;
    use ieee.std_logic_1164.all;
entity nand_gate is 
 port( x,y : IN std_logic;
     z : out std_logic);
 end nand_gate;
  architecture nand_gatearc of nand_gate is 
   begin 
       z <= x nand y;
   end nand_gatearc;


