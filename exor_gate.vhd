library ieee;
    use ieee.std_logic_1164.all;
   entity exor_gate is
       port( x,y : IN std_logic;
           z: out std_logic);
       end exor_gate;
    architecture exor_gatearc of exor_gate is 
    begin 
        z <= x xor y;
    end exor_gatearc;
