library ieee;
    use ieee.std_logic_1164.all;
    entity ckt1 is
        port( x: in std_logic;
		fin: out std_logic);
        end ckt1;
        architecture behav of ckt1 is
            signal w1: std_logic;
            signal w2: std_logic;
            signal w3: std_logic;
            signal w4: std_logic;
            signal y: std_logic;
            begin
                
                w1 <= (not fin) after 5 ps;
                w2 <= (not w1) after 5 ps;
                w3 <= (not w2) after 5 ps;
                w4 <= (not w3) after 5 ps;
                y <= (not w4)  after 5 ps;
                fin <= x or y;
            end behav;
                
             
