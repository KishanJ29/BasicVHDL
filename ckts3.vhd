library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
        use ieee.std_logic_unsigned.all;
        --   CKTS3 is changed to 14bit counter to be used in test.vhd

entity ckts3 is 
 port(clk  : in std_logic;
      din : in std_logic_vector(13 downto 0)
      );
       end ckts3;
  architecture behave of ckts3 is
      signal aout: std_logic;
      signal fclr: std_logic;
      signal clr: std_logic;
      signal aclk: std_logic;
      signal a: std_logic_vector(13 downto 0);
      signal andin: std_logic_vector(13 downto 0);
      signal q , qbar  : std_logic;
      begin
          process(clk, clr)
              begin
                  if fclr = '1' then 
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
           end behave;


