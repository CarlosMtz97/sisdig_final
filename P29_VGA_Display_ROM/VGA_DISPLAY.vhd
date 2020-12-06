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
  
  -- sizes  constant L_BOUND    : natural                        :=  60;  constant R_BOUND    : natural                        := 580;  constant U_BOUND    : natural                        :=  40;  constant D_BOUND    : natural                        := 440;

  -- velocities  constant frijolito_V     : natural                        :=   5;
  
  -- Embedded signals
  signal rgb_now     : STD_LOGIC_VECTOR ( 7 downto 0);
  signal clk_frame   : STD_LOGIC;

begin
--  clk_frame <= '1' when (Xin = 0 and Yin = 0) else--               '0';
  -- ROM component
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
          Color <= "11100000"; -- Red
		  end if;
		else 
		    Color <= "00000000"; -- Black
	   end if;
	 end if;
  end process;--					--  process (clk,x,y)--    variable frijolito_x      : STD_LOGIC_VECTOR (10 downto 0)  := "00101000000"; --320--    variable frijolito_y      : STD_LOGIC_VECTOR (10 downto 0)  := "00011110000"; --240--  begin--    if (rising_edge(clk)) then--	   if (clk_frame = '1') then----		  -- ball control--		  if (rightB = '1' and frijolito_x < CONV_STD_LOGIC_VECTOR(R_BOUND,11)) then   --		    frijolito_x := frijolito_x + frijolito_V;--		  end if;--		  if (leftB  = '1' and frijolito_x > CONV_STD_LOGIC_VECTOR(L_BOUND,11)) then--		    frijolito_x := frijolito_x - frijolito_V;--		  end if;--		  if (downB  = '1' and frijolito_y < CONV_STD_LOGIC_VECTOR(D_BOUND,11)) then--		    frijolito_y := frijolito_y + frijolito_V;--		  end if;--		  if (upB    = '1' and frijolito_y > CONV_STD_LOGIC_VECTOR(U_BOUND,11)) then--		    frijolito_y := frijolito_y - frijolito_V;--		  end if;--			--        -- reset, re-center ball--        if (reset = '1') then--          frijolito_x := CONV_STD_LOGIC_VECTOR(320,11);--          frijolito_y := CONV_STD_LOGIC_VECTOR(240,11);--        end if;		 
--		end if;
--	 end if;--		  -- drawing section -----	--	-- draw background----   if (x >= L_BOUND and y >= U_BOUND and x < R_BOUND and y < 445) then----	   rgb_now <= COLOR_BG;----			----		-- draw ball----      if ((x >= ball_x - BALL_R and x <= ball_x + BALL_R) and----          (y >= ball_y - BALL_R and y <= ball_y + BALL_R)) then----            rgb_now <= COLOR_BALL;	----      end if;----	elsif (x <= (55) and y <= (35) and x > (585) and y > (D_BOUND)) then----		rgb_now <= COLOR_WALL;----		----   else----	   -- outside of the display area, fill black----		rgb_now <= COLOR_NULL;----		----	end if;	--	----	if (x <= (L_BOUND + BALL_R) and y <= (U_BOUND + BALL_R) and x > (R_BOUND + BALL_R) and y > (D_BOUND + BALL_R)) then----		rgb_now <= COLOR_WALL;----	end if;	--     --  end process;
  -- Send individual color to their channel
  R <= Color(7 downto 5);
  G <= Color(4 downto 2);
  B <= Color(1 downto 0);

end Behavioral;

