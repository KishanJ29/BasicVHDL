library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity task_wave is
    port(clk,clr: in std_logic;
        din: in std_logic_vector(2 downto 0);
        o: out std_logic);
          
end task_wave;

architecture behavior of task_wave is
signal dout: std_logic_vector (2 downto 0);
signal a,b,x: std_logic;
signal i: std_logic_vector(7 downto 0);
begin
    counter: process(clk,clr)
    begin
    if clr = '1' then
        dout <= din;
        
    elsif rising_edge(clk) then
        dout <= dout + 1;
end if;
end process counter;

   MUX1: process(clk,clr,dout)
   begin
       if clr = '1' then
           a <= '0';
           
    elsif falling_edge(clk) then
        case dout is
            
            when "000" => a <= '1';
            when "001" => a <= '1';
            when "010" => a <= '1';
            when "011" => a <= '0';
            when "100" => a <= '0';
            when "101" => a <= '0';
            when "110" => a <= '0';
            when others => a <= '0';
            end case;
        end if;
    end process MUX1;
    
    o <= a and clk;
    
   -- MUX2: process (clk,clr,dout)
--    begin 
--        if clr = '1' then
--            b <='0';
--        
--        elsif falling_edge(clk) then
--            
--            case dout is
--                
--            when "000" => b <= i0;
--            when "001" => b <= i1;
--            when "010" => b <= i2;
--            when "011" => b <= i3;
--            when "100" => b <= i4;
--            when "101" => b <= i5;
--            when "110" => b <= i6;
--            when others => b <= i7;
--            
--            end case;
--        end if;
--    end process MUX2;
--             
--    x <= a xor b;

end behavior;