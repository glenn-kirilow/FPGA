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
type integer_array is array(7 downto 0) of std_logic_vector(7 downto 0);
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
    Port ( clk : in STD_LOGIC;
           inputs : in integer_array;
           output : out std_logic_vector(25 downto 0));
end neuron;

architecture Behavioral of neuron is
-- Constants
--constant w1 : positive := 80;
--constant w2 : positive := 70;
--constant w3 : positive := 20;
--constant w4 : positive := 10;
--constant w5 : positive := 40;
--constant w6 : positive := 90;
--constant w7 : positive := 50;
--constant w8 : positive := 20;

-- Signals
signal extended_input1 : std_logic_vector(17 downto 0);
signal extended_input2 : std_logic_vector(17 downto 0);
signal extended_input3 : std_logic_vector(17 downto 0);
signal extended_input4 : std_logic_vector(17 downto 0);
signal extended_input5 : std_logic_vector(17 downto 0);
signal extended_input6 : std_logic_vector(17 downto 0);
signal extended_input7 : std_logic_vector(17 downto 0);
signal extended_input8 : std_logic_vector(17 downto 0);


signal weighted_input1 : std_logic_vector(24 downto 0);
signal weighted_input2 : std_logic_vector(24 downto 0);
signal weighted_input3 : std_logic_vector(24 downto 0);
signal weighted_input4 : std_logic_vector(24 downto 0);
signal weighted_input5 : std_logic_vector(24 downto 0);
signal weighted_input6 : std_logic_vector(24 downto 0);
signal weighted_input7 : std_logic_vector(24 downto 0);
signal weighted_input8 : std_logic_vector(24 downto 0);

signal weighted_output1 : std_logic_vector(25 downto 0);
signal weighted_output2 : std_logic_vector(25 downto 0);
signal weighted_output3 : std_logic_vector(25 downto 0);
signal weighted_output4 : std_logic_vector(25 downto 0);
signal weighted_output5 : std_logic_vector(25 downto 0);
signal weighted_output6 : std_logic_vector(25 downto 0);
signal weighted_output7 : std_logic_vector(25 downto 0);

-- Components
COMPONENT mult_gen_0 IS -- Applies weight constant of 80.
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
  );
END COMPONENT;

begin

extended_input1 <= "0000000000"&inputs(0);
extended_input2 <= "0000000000"&inputs(1);
extended_input3 <= "0000000000"&inputs(2);
extended_input4 <= "0000000000"&inputs(3);
extended_input5 <= "0000000000"&inputs(4);
extended_input6 <= "0000000000"&inputs(5);
extended_input7 <= "0000000000"&inputs(6);
extended_input8 <= "0000000000"&inputs(7);

u1 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input1,
    P => weighted_input1
);

u2 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input2,
    P => weighted_input2
);

u3 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input3,
    P => weighted_input3
);

u4 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input4,
    P => weighted_input4
);

u5 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input5,
    P => weighted_input5
);

u6 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input6,
    P => weighted_input6
);

u7 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input7,
    P => weighted_input7
);

u8 :  mult_gen_0
port map
(
    CLK => clk,
    A => extended_input8,
    P => weighted_input8
);

process (clk)
begin
    if rising_edge(clk) then
        weighted_output1 <= '0'&std_logic_vector(unsigned(weighted_input1) + unsigned(weighted_input2));
        weighted_output2 <= '0'&std_logic_vector(unsigned(weighted_input3) + unsigned(weighted_input4));
        weighted_output3 <= '0'&std_logic_vector(unsigned(weighted_input5) + unsigned(weighted_input6));
        weighted_output4 <= '0'&std_logic_vector(unsigned(weighted_input7) + unsigned(weighted_input8));

        weighted_output5 <= std_logic_vector(unsigned(weighted_output1) + unsigned(weighted_output2));
        weighted_output6 <= std_logic_vector(unsigned(weighted_output3) + unsigned(weighted_output4));

        output <= std_logic_vector(unsigned(weighted_output5) + unsigned(weighted_output6));
    end if;
end process;

end Behavioral;
