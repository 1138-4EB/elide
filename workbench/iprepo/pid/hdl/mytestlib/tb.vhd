--http://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=ControlDigital
--https://dsp.stackexchange.com/questions/14965/how-to-implement-a-filter-in-matlab
--http://stackoverflow.com/questions/22236977/latex-math-in-github-wikis
--

entity tb is
end entity;

---

library ieee;
context ieee.ieee_std_context;

architecture arch of tb is
 constant t: time:= 10 ns;
 signal clk, rst: std_logic;
 signal r: std_logic_vector(7 downto 0):=(others=>'1');
begin

process begin
  clk <= '1'; wait for t/2;
  clk <= '0'; wait for t/2;
end process;

process begin
  rst <= '1'; wait for 10*t;
  rst <= '0'; wait for 5 ms;
end process;

process begin
  r <= std_logic_vector(to_signed(0,8)); wait for 1 us;
  r <= std_logic_vector(to_signed(63,8)); wait for 1 ms;
  r <= std_logic_vector(to_signed(127,8)); wait for 1 ms;
  wait;
end process;

uut: entity work.sys port map ( clk, rst, r );

end arch;