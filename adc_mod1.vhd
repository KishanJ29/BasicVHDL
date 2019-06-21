 library ieee;
     use ieee.std_logic_1164.all;
     use ieee.std_logic_arith.all;
     use ieee.std_logic_unsigned.all;
    entity adc_mod1 is 
       port( clk : in std_logic );
    end adc_mod1;
    architecture behave of adc_mod1 is 
     signal  clr, andin,aclk,q,qout,qoutbar,d,fclr  : std_logic;
  --   signal op :  std_logic_vector(2 downto 0));
     signal a: std_logic_vector(2 downto 0);
      begin
      counter:      process(clk, fclr)
              begin
                  if fclr = '1' then 
                     a <= "000";
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
               end process;
               
               andin <= a(2) and (not a(1)) and a(0) ;
               aclk <= (clk);
            process(aclk, fclr)
               begin
                   if fclr = '1' then
                       q <= '0';
                       elsif falling_edge(aclk) then
                           q <= andin;
                           
                       end if;
                   end process;
                   fclr <= (q or clr);    
            
        clock_divide: process(aclk,clr) 
         begin 
           d <= not qout;       
             if clr = '1' then 
              qout <= '0';
              qoutbar<= '1';
              elsif rising_edge(aclk) then
               qout <= d;
               qoutbar<= not d;
            end if;
        end process; 
  
             
           end behave;
                       
