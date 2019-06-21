library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
     entity count_mux is 
      port( din : in std_logic_vector(2 downto 0);
           clk,clr :in std_logic
           );
    end entity;
    architecture behav of count_mux is 
     signal dout: std_logic_vector( 2 downto 0);
     signal a : std_logic_vector(2 downto 0);
     signal x1,x2,x3,x4,x5,x6,x7,y :integer;
     
            begin 
        process(din,clk,clr)
            begin
            if clr = '1' then 
                     a <= din;
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
               end process;
               dout <= a;
           
        process (dout)
            begin
                x1<= 0;
                x2<= 1;
                x3<= 2;
                x4<= 3;
                x5<= 4;
                x6<= 5;
                x7<= 6;
             case dout is
                  when "000" => y <= x1;
                  when "001" => y <= x2;
                  when "010" => y <= x3;
                  when "011" => y <= x4;
                  when "100" => y <= x5;
                  when "110" => y <= x6;
                  when others => y <= x7;
              end case;
          end process;
           end behav;
           
