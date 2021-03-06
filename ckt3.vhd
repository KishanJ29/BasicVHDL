library ieee;
    use ieee.std_logic_1164.all;
    entity ckt3 is
        port(a: in std_logic_vector(4 downto 0);
            b: out std_logic);
        end ckt3;
        architecture behav of ckt3 is
            signal w: std_logic;
            begin
                w <= not a(1);
                b <= (a(0) and w and a(2) and a(3) and a(4));
            end behav;
