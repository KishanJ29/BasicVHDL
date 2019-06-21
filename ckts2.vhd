library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
        use ieee.std_logic_unsigned.all;
entity ckts2 is 
 port(clk  : in std_logic;
      din : in std_logic_vector(4 downto 0)
      --dout : out std_logic_vector(4 downto 0)
      );
  end ckts2;
  architecture behave of ckts2 is
      signal aout: std_logic;
      signal clr: std_logic;
      signal clr1: std_logic;
      signal a: std_logic_vector(4 downto 0);
      signal andin: std_logic_vector(4 downto 0);
      begin
          process(clk, clr)
              begin
                  if clr = '1' then 
                     a <= din;
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
              
            --   dout <= a;
                 end process;
            andin <= a;
            aout <= (not andin(0)) and andin(1) and (not andin(2)) and andin(3) and andin(4);
            clr <= (aout or clr1) after 20 ps;       
           end behave;

