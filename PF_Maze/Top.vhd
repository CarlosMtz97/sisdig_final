----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:56 12/06/2020 
-- Design Name: 
-- Module Name:    Top - Top_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( Clk         : in  STD_LOGIC;
           Rst         : in  STD_LOGIC;
           rightButton : in  STD_LOGIC;
           leftButton  : in  STD_LOGIC;
           upButton    : in  STD_LOGIC;
           downButton  : in  STD_LOGIC;
           Red         : out  STD_LOGIC_VECTOR (2 downto 0);
           Green       : out  STD_LOGIC_VECTOR (2 downto 0);
           Blue        : out  STD_LOGIC_VECTOR (1 downto 0);
           Hsync       : out  STD_LOGIC;
           Vsync       : out  STD_LOGIC );
end Top;

architecture Top_Arch of Top is

	-- Component declarations	  	-- VGA controller component	-- Generated the necessary timing for the VGA signal	component VGA	port (	 Clk    : in  STD_LOGIC; -- Board Clock	 Rst    : in  STD_LOGIC; -- Board Reset	 X      : out STD_LOGIC_VECTOR(9 downto 0); -- X coordinate of the screen	 Y      : out STD_LOGIC_VECTOR(9 downto 0); -- Y coordinate of the screen	 Active : out STD_LOGIC; -- When '1', indicates you are in the screen where pixels can be drawn	 Hsync  : out STD_LOGIC; -- Horizontal synchronization signal	 Vsync  : out STD_LOGIC);-- Vertical synchronization signal	end component;
	
	-- Component that will contain the image/figure that
	-- will appear on the screen
	component VGA_Display
	port (
	 Clk    : in  STD_LOGIC;
	 Xin    : in  STD_LOGIC_VECTOR(9 downto 0);     -- Column screen coordinate
	 Yin    : in  STD_LOGIC_VECTOR(9 downto 0);  -- Row screen coordinate
	 En     : in  STD_LOGIC; 							-- When '1', pixels can be drawn 
	 rightB : in  STD_LOGIC;
	 leftB  : in  STD_LOGIC;
	 upB    : in  STD_LOGIC;
	 downB  : in  STD_LOGIC;
	 R      : out STD_LOGIC_VECTOR(2 downto 0);  -- 3-bit Red channel
	 G      : out STD_LOGIC_VECTOR(2 downto 0);  -- 3-bit Green channel
	 B      : out STD_LOGIC_VECTOR(1 downto 0)); -- 2-bit Blue channel
	end component;
	
	-- Embedded signals to interconnect components	 signal X_emb      : STD_LOGIC_VECTOR(9 downto 0);	 signal Y_emb      : STD_LOGIC_VECTOR(9 downto 0);  	 signal Active_emb : STD_LOGIC;

begin
	-- Component instantiation (component connecting)	-- New style of instantiation	C01 : VGA 	port map (	 Clk        => Clk,	 Rst        => Rst,	 X_emb      => X_emb,	 Y_emb      => Y_emb,	 Active_emb => Active_emb,	 Hsync      => Hsync,	 Vsync      => Vsync);	
	-- Classic style of instantiation
	C02 : VGA_DISPLAY
	port map (
	 Clk    => Clk,
	 Xin    => X_emb,
	 Yin    => Y_emb,
	 En     => Active_emb,
	 rightB => rightButton,
	 leftB  => leftButton,
	 upB    => upButton,
	 downB  => downButton,
	 R      => Red,
	 G      => Green,
	 B      => Blue);

end Top_Arch;

