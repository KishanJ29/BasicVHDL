library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
 entity prngen is 
  port( clk,clr,load :in std_logic;
       datain : in std_logic_vector(7 downto 0);
       prdata : out std_logic_vector(7 downto 0);
       dout   : out std_logic);
   end prngen;
 architecture behav of prngen is
     signal cntr : std_logic_vector(7 downto 0);
     signal treg : std_logic_vector(7 downto 0);
     signal y: std_logic;
     begin
label1:  process(clk,clr)
         begin 
           if clr = '1' then 
           cntr <= "00000000";
           elsif rising_edge(clk) then 
           cntr <= cntr + 1 ;
       end if;
   end process label1;\
	
shiftreg :   process(load,clk,clr, cntr)
   begin 
       if clr = '1' then 
        treg <= "00000000";
        elsif falling_edge(clk) then 
          if load = '1' then
        --treg <= datain; for manual datain
        treg <= cntr; 
        -- for noise generation
         else 
           dout    <= treg(0);
           treg(0) <= treg(1);
           treg(1) <= treg(2);
           treg(2) <= treg(3);
           treg(3) <= treg(4);
           treg(4) <= treg(5);
           treg(5) <= treg(6);
           treg(6) <= treg(7);
           treg(7) <= y;
           end if ; 
       end if;  
   
 end process shiftreg;
    y <= treg(1) xor treg(3) xor treg(5) xor treg(7);
    prdata <= treg;
    
end behav;
  