----------------------------------------------------------------------------------
-- Company: DecodingFPGA
-- Engineer: Arun
-- 
-- Create Date: 03/02/2026 05:07:49 PM
-- Design Name: Binary to Gray State Machine TB 1.0v
-- Module Name: bintogray - Behavioral
-- Project Name: Binary to Gray converter TB
-- Target Devices: EDGE ZYNQ SoC FPGA Development Board
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bintogray_fsm_tb is
end bintogray_fsm_tb;

architecture test of bintogray_fsm_tb is
    constant    CLK_PERIOD   :   time                           :=  10ns;
    
    signal      clk          :   std_logic                       :=  '0';
    signal      rst          :   std_logic                       :=  '0';
    signal      sw           :   std_logic_vector(3 downto 0)    :=  "0000";
    signal      led          :   std_logic_vector(3 downto 0)    :=  "0000"; 
    signal      led_check    :   std_logic_vector(3 downto 0);
    
begin

    DUT: entity work.bintogray
        port map (
            clk => clk,
            rst => rst,
            sw  => sw,
            led => led
    );

    CLK_PROCESS: process begin
        while true loop
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
        end loop;  
    end process;
       
    STIMULUS_PROCESS: process begin
        -- Check Reset repsonse
        wait for 50ns;
        rst <= '1';
        
        wait for 10ns;
        rst <= '0';
        
        -- End Reset Check
        
        -- Check the led output
        wait for 50ns;
        sw  <=  "0001";
        led_check <= "0001";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "0011";
        led_check <= "0011";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "0101";
        led_check <= "0111";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "0111";
        led_check <= "0101";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "1001";
        led_check <= "1101";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "1011";
        led_check <= "1111";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "1101";
        led_check <= "1011";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        wait for 50ns;
        sw  <=  "1111";
        led_check <= "1001";
        wait for 50ns;
        assert led = led_check report "Mismatch! LED=" & integer'image(to_integer(unsigned(led))) & " Expected= " & integer'image(to_integer(unsigned(led_check))) severity error;
  
        report "All test cases passed!" severity note;
        
        wait;
        -- End led output Check
    end process;   
end test;
