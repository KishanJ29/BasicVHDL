 library ieee;
     use ieee.std_logic_1164.all;
     use ieee.std_logic_arith.all;
     use ieee.std_logic_unsigned.all;
    entity adc_mod2 is 
       port( clk : in std_logic );
    end adc_mod2;
    architecture behave of adc_mod2 is 
    signal  clr, andin,aclk,q,qout,qoutbar,d  : std_logic;
     signal  clk2  : std_logic;
  --   signal op :  std_logic_vector(2 downto 0));
     signal a: std_logic_vector(2 downto 0);
      begin
      counter:    process(clk, clr)
              begin
                  if clr = '1' then 
                     a <= "000";
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
               end process;
               
               andin <= a(2) and (not a(1)) and a(0) ;
               aclk <= (clk)after 10 ps;
               
               
             
           end behave;
