----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Rick
-- 
-- Create Date:    10:19:48 11/08/2017 
-- Design Name: 
-- Module Name:    VGA_DISPLAY - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Here a drawing will be created 
--  
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
-- Commonly used libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity VGA_DISPLAY is
  generic (
    ImageCols : natural := 256;    -- Image Size, number of Columns
    ImageRows : natural := 256;    -- Image Size, number of Rows
	 PosCol    : natural := 100;    -- Top left corner column position where image will be drawn
	 PosRow    : natural := 100);   -- Top left corner row position where image will be drawn
  port (
    Clk : in  STD_LOGIC;
	 Xin : in  STD_LOGIC_VECTOR(9 downto 0); -- Column screen coordinate
	 Yin : in  STD_LOGIC_VECTOR(9 downto 0); -- Row screen coordinate
	 En  : in  STD_LOGIC;                    -- When '1', pixels can be drawn 
	 R   : out STD_LOGIC_VECTOR(2 downto 0); -- 3-bit Red channel
	 G   : out STD_LOGIC_VECTOR(2 downto 0); -- 3-bit Green channel
	 B   : out STD_LOGIC_VECTOR(1 downto 0));-- 2-bit Blue channel
end VGA_DISPLAY;

architecture Behavioral of VGA_DISPLAY is

  component ROM_1
  port (
     CLKA  : in  STD_LOGIC;
	  ADDRA : in  STD_LOGIC_VECTOR(15 downto 0);
	  DOUTA : out STD_LOGIC_VECTOR( 7 downto 0));
  end component;
  
  -- Embedded signal to group the colors into 1-byte
  -- The colors will be as follows:
  --  R2 R1 R0 G2 G1 G0 B1 B0
  signal Color :  STD_LOGIC_VECTOR(7 downto 0);
  
  -- ROM memory Address and Data Bus
  signal Address: STD_LOGIC_VECTOR(15 downto 0);
  signal Data:    STD_LOGIC_VECTOR( 7 downto 0);

  signal Location : natural range 0 to ((ImageCols * ImageRows) - 1);  

begin
  C01 : ROM_1
  port map (
     CLKA  => Clk,
     ADDRA => Address,
     DOUTA => Data);
	  
  Address <= Xin(7 downto 0) + (Yin(7 downto 0) & "00000000");

  process (Clk)
  begin
    -- Check if pixel is in the active zone
	 if rising_edge(Clk) then
	   if (En = '1') then
	     if (Xin < ImageCols and Yin < ImageRows) then
			 Color <= Data; -- ROM pixel
		  else
          Color <= "00000000"; -- Black
		  end if;
		else 
		  Color <= "00000000"; -- Black
	   end if;
	 end if;
  end process;
  
  -- Send individual color to their channel
  R <= Color(7 downto 5);
  G <= Color(4 downto 2);
  B <= Color(1 downto 0);

end Behavioral;

