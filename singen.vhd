library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
     entity singen is 
      port( din : in std_logic_vector(3 downto 0);
           clk :in std_logic
           );
    end singen;
    architecture behav of singen is 
     signal dout: std_logic_vector( 3 downto 0);
     signal a : std_logic_vector(3 downto 0);
     signal x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,y :integer;
      signal aout: std_logic;
      signal fclr: std_logic;
      signal clr: std_logic;
      signal aclk: std_logic;
      signal andin: std_logic_vector(3 downto 0);
      signal q : std_logic;
     
            begin 
       -- process(din,clk,clr)
       --     begin
       --     if clr = '1' then 
       --              a <= din;
       --            elsif rising_edge(clk) then
       --                a <= a + 1;
        --           end if;
        --       end process;
        --       dout <= a;
               --------------------------------------
                process(clk, clr)
              begin
                  if fclr = '1' then 
                     a <= din;
                   elsif rising_edge(clk) then
                       a <= a + 1;
                   end if;
              
              dout <= a;
                 end process;
            andin <= a;
            aout <=  andin(0) and (not andin(1)) and  andin(2) and andin(3);
            aclk <= (clk)after 20 ps;
            process(aclk, clr)
               begin
                   if clr = '1' then
                       q <= '0';
                     --  qbar <= '0';
                       elsif falling_edge(aclk) then
                           q <= aout;
                       --    qbar <= not aout;
                       end if;
                   end process;
            fclr <= (q or clr); --after 20 ps;
           
        process (dout)
            begin
                x1<= 0;
                x2<= 1;
                x3<= 2;
                x4<= 3;
                x5<= 2;
                x6<= 1;
                x7<= 0;
                x8<= -1;
                x9<= -2;
                x10<= -3;
                x11<= -2;
                x12<= -1;
                x13<= 0;
             case dout is
                  when "0000" => y <= x1;
                  when "0001" => y <= x2;
                  when "0010" => y <= x3;
                  when "0011" => y <= x4;
                  when "0100" => y <= x5;
                  when "0101" => y <= x6;
                  when "0110" => y <= x7;
                  when "0111" => y <= x8;
                  when "1000" => y <= x9;
                  when "1001" => y <= x10;
                  when "1010" => y <= x11;
                  when "1011" => y <= x12;    
                  when others => y <= x13;
              end case;
          end process;
           end behav;
           