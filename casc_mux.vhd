library ieee;
    use ieee.std_logic_1164.all;
    entity casc_mux is
        port(i: in std_logic_vector (7 downto 0);
            s: in std_logic_vector (1 downto 0);
            z: out std_logic);
        end casc_mux;
    architecture behav of casc_mux is
        signal x: std_logic;
        signal y: std_logic;
        begin
            process(s)
              begin 
                  case s is
                  when "00" => x <= i(0);
                  when "01" => x <= i(1);
                  when "10" => x <= i(2);
                  when others => x <= i(3);
              end case;
          end process;
            process(s)
              begin 
                  case s is
                  when "00" => y <= x;
                  when "01" => y <= i(5);
                  when "10" => y <= i(6);
                  when others => y <= i(7);  
              end case;
          end process;
      end behav;
