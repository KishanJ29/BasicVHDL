library ieee;
    use ieee.std_logic_1164.all;
entity d_ff is 
   port(clk, clr, d: in std_logic;
       q, qbar: out std_logic);
   end d_ff;
   architecture behav of d_ff is
       begin
           process(clk, clr)
               begin
                   if clr = '1' then
                       q <= '0';
                       qbar <= '0';
                       elsif rising_edge(clk) then
                           q <= d;
                           qbar <= not d;
                       end if;
                   end process;
               end behav;