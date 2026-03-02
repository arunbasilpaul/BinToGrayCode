----------------------------------------------------------------------------------
-- Company: DecodingFPGA
-- Engineer: Arun
-- 
-- Create Date: 03/02/2026 05:07:49 PM
-- Design Name: Binary to Gray State Machine 1.0v
-- Module Name: bintogray - Behavioral
-- Project Name: Binary to Gray converter
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

entity bintogray is
  Port (
    clk :   in  std_logic;
    rst :   in  std_logic;
    sw  :   in  std_logic_vector(3 downto 0);
    led :   out std_logic_vector(3 downto 0)
   );
end bintogray;

architecture Behavioral of bintogray is
    type STATEOFPROCESS is (IDLE, READY, READ, CONVERT, WRITE);
    signal current_state, next_state : STATEOFPROCESS;
    
    signal bin_reg : std_logic_vector(3 downto 0);
    signal gray_reg: std_logic_vector(3 downto 0);
      
begin

    StateProcess: process(clk, rst) begin
        if(rst = '1') then
            current_state   <=  IDLE;
        elsif(rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;
    
    NextStateProcess: process(current_state, sw) begin        
        if(current_state = IDLE) then
            next_state      <=  READY;
            
        elsif(current_state = READY) then
            next_state      <=  READ;
                
        elsif(current_state = READ and sw(0) = '1') then
            next_state      <=  CONVERT;
            
        elsif(current_state = CONVERT) then
            next_state      <=  WRITE;    
            
        elsif(current_state = WRITE) then
            next_state      <= IDLE; 
        end if;
    end process;
    
    BINTOGRAYPROCESS: process(clk) begin
        if(rising_edge(clk)) then
            case current_state is
                when READ =>
                    bin_reg  <=  sw;
               
                when CONVERT =>
                    gray_reg(3) <=  bin_reg(3);
                    gray_reg(2) <=  bin_reg(3) xor bin_reg(2);
                    gray_reg(1) <=  bin_reg(2) xor bin_reg(1);
                    gray_reg(0) <=  bin_reg(0);    
            
                when WRITE =>
                    led <= gray_reg;
                    
                when others =>
                    null;
            end case;    
        end if;
    end process;
    
end Behavioral;
