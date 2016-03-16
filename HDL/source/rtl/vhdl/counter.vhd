-------------------------------------------------------------------------------
--  Odsek za racunarsku tehniku i medjuracunarske komunikacije
--  Autor: LPRS2  <lprs2@rt-rk.com>                                           
--                                                                             
--  Ime modula: timer_counter                                                           
--                                                                             
--  Opis:                                                               
--                                                                             
--    Modul broji sekunde i prikazuje na LED diodama                                         
--                                                                             
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



ENTITY counter2d IS 
		GENERIC (

				WIDTH    : positive := 10;
				N_ROWS   : integer := 640;
				N_COLS	 : integer := 480;
		);
		PORT (
			   clk_i     : IN STD_LOGIC;
			   rst_i     : IN STD_LOGIC;
			   cnt_en_i  : IN STD_LOGIC;
				row_o  : out std_logic_vector(WIDTH-1 downto 0);
				col_o  : out std_logic_vector(WIDTH-1 downto 0);
			 );
END counter2d;




ARCHITECTURE rtl OF counter2d IS
	
	
BEGIN

	process(clk_i,in_rst) begin
		if rising_edge(in_rst) then
			cnt <= (others => '0');
		elsif rising_edge(clk_i) and cnt_en_i = '1' then
			if cnt < N_COLS then
				cnt <= cnt + 1;
			else
				cnt <= (others => '0');
				if cnt_rows < N_ROWS then
					cnt_rows <= cnt_rows + 1;
				else
					cnt_rows <= (others => '0');
					cnt <= (others => '0');
				end if;
			end if;
		end if;
	end process;

	col_o <= cnt;
	row_o <= cnt_rows;

END rtl;
