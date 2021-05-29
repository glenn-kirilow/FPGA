----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Glenn Kirilow
-- 
-- Create Date: 05/29/2021 03:29:08 PM
-- Design Name: 
-- Module Name: modncounter - RTL
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity modncounter is
    Generic
    (
        N : positive := 10
    );
    Port 
    ( 
        clk : in std_logic;
        count : out positive range 0 to (N - 1)
    );
end modncounter;

architecture RTL of modncounter is

begin

process(clk)
    variable cnt : positive range 0 to (N - 1);
begin
    if rising_edge(clk) then
        cnt := cnt + 1;
    end if;
    count <= cnt;
end process;

end RTL;