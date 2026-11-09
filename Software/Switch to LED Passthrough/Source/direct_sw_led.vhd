library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity direct_sw_led is
    Port (
        sw  : in  STD_LOGIC_VECTOR(15 downto 0); 
        led : out STD_LOGIC_VECTOR(15 downto 0) 
    );
end direct_sw_led;

architecture Behavioral of direct_sw_led is
begin
    led <= sw;

end Behavioral;
