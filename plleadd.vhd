library ieee;
    use ieee.std_logic_1164.all;
entity plleadd is
    port( a,b : in std_logic_vector(3 downto 0);
         sum: out std_logic_vector(3 downto 0);
         carry: out std_logic;
         cin: in std_logic);
     end plleadd;
     architecture behave of plleadd is 
      begin
      process(a,b,cin)
          variable u: std_logic;
      begin
          u:=  cin;
          for i in 0 to 3 loop
          sum(i) <= a(i) xor b(i) xor u;
          u := (a(i) and b(i)) or (b(i) and u) or (a(i) and u);
      end loop;
      carry <= u;
  end process;
      end behave;

