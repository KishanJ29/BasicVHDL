library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
 entity three_pulse is 
  port(clk  : in std_logic);
   end three_pulse;
   architecture behav of three_pulse is 
   signal aout: std_logic;
      signal fclr: std_logic;
      signal clr: std_logic;
      signal aclk: std_logic;
      signal din: std_logic_vector(13 downto 0);
      signal a: std_logic_vector(13 downto 0);
      signal andin: std_logic_vector(13 downto 0);
      signal q , qbar  : std_logic;
      signal qout , qoutbar, d : std_logic;
      signal muxout,x: std_logic;
      signal dout: std_logic_vector(2 downto 0);
      signal z: std_logic;
      begin
          process(clk, clr)
              begin
                  if fclr = '1' then 
                     din <= "00000000000000";
                     a <= din;
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
              
            --   dout <= a;
                 end process;
            andin <= a;
            aout <= andin(0) and (not andin(1)) and (not andin(2)) and (andin(3)) and andin(4) and (andin(5)) and (not andin(6)) and (not andin(7)) and (andin(8)) and andin(9) and andin(10) and (not andin(11)) and (not andin(12)) and (andin(13));
            aclk <= (clk)after 10 ps;
            process(aclk, clr)
               begin
                   if clr = '1' then
                       q <= '0';
                       qbar <= '0';
                       elsif falling_edge(aclk) then
                           q <= aout;
                           qbar <= not aout;
                       end if;
                   end process;
            fclr <= (q or clr) after 20 ps; 
            
     clock_divide: process(q,clr) 
         begin 
           d <= not qout;       
             if clr = '1' then 
              qout <= '0';
              qoutbar<= '1';
              elsif rising_edge(q) then
               qout <= d;
               qoutbar<= not d;
      end if;
      
  end process; 
  
  counter: process(clk,clr)
    begin
    if clr = '1' then
        dout <= "000";
        
    elsif rising_edge(clk) then
        dout <= dout + 1;
end if;
end process counter; 
   
   MUX1: process(clk,clr,dout)
   begin
       if clr = '1' then
           muxout <= '0';
           
    elsif falling_edge(clk) then
        case dout is
            
            when "000" => muxout <= '1';
            when "001" => muxout <= '1';
            when "010" => muxout <= '1';
            when "011" => muxout <= '0';
            when "100" => muxout <= '0';
            when "101" => muxout <= '0';
            when "110" => muxout <= '0';
            when others => muxout <= '0';
            end case;
        end if;
    end process MUX1;
    x <= muxout and clk;
    z <= qout xor x;
        end behav;