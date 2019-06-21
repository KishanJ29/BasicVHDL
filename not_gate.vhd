library ieee;
    use ieee.std_logic_1164.all;
        entity not_gate is 
        Port(x: IN std_logic;
        z: out std_logic);
    end not_gate;
architecture or_gatearc of not_gate is 
 begin 
     z<= not x;
 end or_gatearc;
 
