library ieee;
    use ieee.std_logic_1164.all;
    entity ckt2 is 
    port(x: in std_logic;
        z: out std_logic);
    end entity;
    architecture behav of ckt2 is
        signal y: std_logic;
        signal w1: std_logic;        
        signal w2: std_logic;
        signal w3: std_logic; 
        signal w4: std_logic;
        signal fin: std_logic;
        signal fin2: std_logic;
        begin
            fin <= x xor y;
            
            w1 <= (not x) after 5 ps;
            w2 <= (not w1) after 5 ps;
            w3 <= (not w2) after 5 ps;
            w4 <= (not w3) after 5 ps;
            fin2 <= fin xor w4;
            y <= fin2;          
            z <= fin2;
        end behav;
            
