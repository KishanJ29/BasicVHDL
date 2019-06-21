library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
        use ieee.std_logic_unsigned.all;

entity  count_tb is 
end count_tb;

   architecture beh of count_tb is 
   component count is 
        port(clk,clr : in std_logic;
            op : out std_logic_vector(2 downto 0));
       end component;
         signal clk,clr:std_logic:='0';
         signal op :std_logic_vector(2 downto 0):="000";
          begin
              testbench_1: count port map(clk,clr,op);
         sim1 : process
                begin
                    clk <= '1';
                    wait for 50 ps;
                    clk <= '0';
                    wait for 50 ps;
                end process sim1;
         sim2  : process
                  begin 
                  clr <= '1';
                  wait for 500 ps ;
                  clr <='0';
                  wait ;
              end process sim2;
        end beh;           
                     