library ieee;
    use ieee.std_logic_1164.all;
entity hw1 is
    port( x,y: in Std_logic;
           z: out Std_logic);
     end hw1;
        architecture behave of hw1 is 
           signal q1 : Std_logic;
           signal q2 : Std_logic; 
           signal q3 : Std_logic;
           signal q4 : Std_logic;
         begin 
                   
            q1 <= x and y;
            q2 <= x nand y;
            q3 <= x xnor y;
            q4 <= q1 xor q2;
             
            z <= q4 and q3;
         end behave;  