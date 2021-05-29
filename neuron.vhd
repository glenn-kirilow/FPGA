----------------------------------------------------------------------------------
-- Company: theEEView
-- Engineer: Glenn Kirilow
-- 
-- Create Date: 05/29/2021 10:25:26 AM
-- Design Name: 
-- Module Name: neuron - Behavioral
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

-- Define a type to be used in the entity
package array_type is
constant N: positive := 2;
type positive_array is array(N downto 0) of positive range 0 to 100;
type std_logic_vectory_array is array(N downto 0) of std_logic_vector(17 downto 0);
type std_logic_vectory_array2 is array(N downto 0) of std_logic_vector(24 downto 0);
type std_logic_vectory_array3 is array(N downto 0) of std_logic_vector(25 downto 0);
end package array_type;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.array_type.all;


entity neuron is
    Generic 
    (
        INPUT_COUNT : integer := 2
    );
    Port 
    ( 
        clk : in STD_LOGIC;
        inputs : in positive_array;
        output : out positive range 0 to 20000
    );
end neuron;

architecture Behavioral of neuron is
-- Constants

-- Signals
signal extended_inputs : std_logic_vectory_array;
signal weighted_inputs : std_logic_vectory_array2;
signal weighted_outputs : std_logic_vectory_array3;

-- Components
COMPONENT mult_gen_0 IS -- Applies weight constant of 80.
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
  );
END COMPONENT;

begin

INPUT_EXTEND_GEN : for i in 0 to (N - 1) generate
    extended_inputs(i) <= std_logic_vector(to_unsigned(inputs(i),extended_inputs(i)'length));
end generate;

MULT_GEN : for i in 0 to (N - 1) generate
    MULTIPLIER : mult_gen_0
    port map
    (
        CLK => clk,
        A => extended_inputs(i),
        P => weighted_inputs(i)
    );
end generate;

process (clk)
    variable v_weighted_output : positive range 0 to 20000;
begin
    if rising_edge(clk) then
        l_acc : for ii in 0 to (N - 1) loop
            v_weighted_output := v_weighted_output + positive(to_integer(unsigned(weighted_inputs(ii))));
        end loop; -- ii
        output <= v_weighted_output;
    end if;
end process;

end Behavioral;
