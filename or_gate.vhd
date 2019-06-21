library ieee;
    use ieee.std_logic_1164.all;
entity or_gate is 
 port(x,y: IN std_logic ;
     z : out std_logic);
 end or_gate;
    architecture orgate_arc of or_gate is 
       begin 
           z<= x or y;
       end orgate_arc;
