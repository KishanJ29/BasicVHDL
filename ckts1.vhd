 library ieee;
    use ieee.std_logic_1164.all;
entity ckts1 is 
   port( clk,clr: in std_logic);
        --q, qbar : out std_logic
       
    end ckts1;
architecture behav of ckts1 is 
      signal q : std_logic;
      signal d : std_logic;
      signal qbar:std_logic;
  begin 
     process(clk,clr) 
         begin 
           d <= not q;       
             if clr = '1' then 
              q <= '0';
              qbar<= '1';
              elsif rising_edge(clk) then
               q <= d;
               qbar<= not d;
      end if;
      
  end process;
  end behav;
  
 
      
