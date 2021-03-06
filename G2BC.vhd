library ieee;
     use ieee.std_logic_1164.all;
    entity  g2bc is 
     port(g : in std_logic_vector(3 downto 0);
         b : out std_logic_vector(3 downto 0));
     end g2bc;
    architecture behav of g2bc is
    signal w : std_logic_vector(1 downto 0); 
     begin
         b(3) <= g(3);
         w(1) <= g(3) xor g(2);
         b(2) <= w(1);
         w(0) <= w(1) xor g(1);
         b(1) <= w(0);
         b(0) <= w(0) xor g(0);
     end behav; 
