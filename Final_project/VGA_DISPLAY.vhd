----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:13 12/07/2020 
-- Design Name: 
-- Module Name:    VGA_DISPLAY - Behavioral 
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
-- Commonly used libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


entity VGA_DISPLAY is
  generic (
    ImageCols : natural := 50;    -- Image Size, number of Columns
    ImageRows : natural := 50;    -- Image Size, number of Rows
	 PosCol    : natural := 100;    -- Top left corner column position where image will be drawn
	 PosRow    : natural := 100);   -- Top left corner row position where image will be drawn
  port (
    Clk    : in  STD_LOGIC;
	 Xin    : in  STD_LOGIC_VECTOR(9 downto 0); -- Column screen coordinate
	 Yin    : in  STD_LOGIC_VECTOR(9 downto 0); -- Row screen coordinate
	 En     : in  STD_LOGIC;                    -- When '1', pixels can be drawn 
	 rightB : in  STD_LOGIC;
	 leftB  : in  STD_LOGIC;
	 upB    : in  STD_LOGIC;
	 downB  : in  STD_LOGIC;
	 R      : out STD_LOGIC_VECTOR(2 downto 0); -- 3-bit Red channel
	 G      : out STD_LOGIC_VECTOR(2 downto 0); -- 3-bit Green channel
	 B      : out STD_LOGIC_VECTOR(1 downto 0));-- 2-bit Blue channel
end VGA_DISPLAY;

architecture Behavioral of VGA_DISPLAY is

  component ROM_1
  port (
     CLKA  : in  STD_LOGIC;
	  ADDRA : in  STD_LOGIC_VECTOR(11 downto 0);
	  DOUTA : out STD_LOGIC_VECTOR( 7 downto 0));
  end component;
  
  -- Embedded signal to group the colors into 1-byte
  -- The colors will be as follows:
  --  R2 R1 R0 G2 G1 G0 B1 B0
  signal   Color      : STD_LOGIC_VECTOR(7 downto 0);
  constant COLOR_BG   : STD_LOGIC_VECTOR ( 7 downto 0) := "01001000";
  constant COLOR_BALL : STD_LOGIC_VECTOR ( 7 downto 0) := "11011101";
  constant COLOR_NULL : STD_LOGIC_VECTOR ( 7 downto 0) := "00000000";
  
  -- ROM memory Address and Data Bus
  signal Address: STD_LOGIC_VECTOR(11 downto 0);
  signal Data:    STD_LOGIC_VECTOR( 7 downto 0);

  signal Location : natural range 0 to ((ImageCols * ImageRows) - 1);  
  
  -- sizes
  constant L_BOUND    : natural                        :=  60;
  constant R_BOUND    : natural                        := 580;
  constant U_BOUND    : natural                        :=  40;
  constant D_BOUND    : natural                        := 440;
  
  -- Embedded signals
  signal rgb_now     : STD_LOGIC_VECTOR ( 7 downto 0);
  signal clk_frame   : STD_LOGIC;
  
   -- velocities
  constant cookie_v     : natural                        :=   1;

begin
  clk_frame <= '1' when (Xin = 0 and Yin = 0) else
               '0';
					
  C01 : ROM_1
  port map (
     CLKA  => Clk,
     ADDRA => Address,
     DOUTA => Data);
	  
  Address <= Xin(7 downto 0) + (Yin(7 downto 0) & "0000");

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
 
   process (Clk,Xin,Yin)
    variable cookie_x      : STD_LOGIC_VECTOR (10 downto 0)  := "00101000000"; --320
    variable cookie_y      : STD_LOGIC_VECTOR (10 downto 0)  := "00011110000"; --240
  begin
    if (rising_edge(clk)) then
	   if (clk_frame = '1') then
		  -- ball control
		  if (rightB = '1' and cookie_x < CONV_STD_LOGIC_VECTOR(R_BOUND,11)) then   
		    cookie_x := cookie_x + cookie_v;
		  end if;
		  if (leftB = '1' and cookie_x > CONV_STD_LOGIC_VECTOR(L_BOUND,11)) then
		    cookie_x := cookie_x - cookie_v;
		  end if;
		  if (downB = '1' and cookie_y < CONV_STD_LOGIC_VECTOR(D_BOUND,11)) then
		    cookie_y := cookie_y + cookie_v;
		  end if;
		  if (upB = '1' and cookie_y > CONV_STD_LOGIC_VECTOR(U_BOUND,11)) then
		    cookie_y := cookie_y - cookie_v;
		  end if;
			
        -- reset, re-center ball
--        if (reset = '1') then
--          cookie_x := CONV_STD_LOGIC_VECTOR(320,11);
--          cookie_y := CONV_STD_LOGIC_VECTOR(240,11);
--        end if;		 		 
		end if;
	 end if;

	-- drawing section ---
	
	-- draw background
   if (Xin >= 0 and Yin >= 0 and Xin < 640 and Yin < 480) then
	   rgb_now <= COLOR_BG;
			
   else
	   -- outside of the display area, fill black
		rgb_now <= COLOR_NULL;
		
	end if;		
     
  end process;
  
  -- Send individual color to their channel
  R <= Color(7 downto 5);
  G <= Color(4 downto 2);
  B <= Color(1 downto 0);

end Behavioral;

