ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity synth_top is
    Port (
        clk_100mhz : in  STD_LOGIC;                      -- 100 MHz системлен часовник на Basys3 (1 бит)
        sw         : in  STD_LOGIC_VECTOR(15 downto 0);  -- 16 превключвателя за нотите (16-битова шина)
        audio_out  : out STD_LOGIC                       -- Аудио изход към пин на платката (1 бит)
    );
end synth_top;

architecture Behavioral of synth_top is

    -- Честотни константи (броячи за 100 MHz часовник)
    -- Формула: Limit = 100,000,000 / (2 * Frequency)
    constant C4  : integer := 191113;  -- 261.63 Hz
    constant CS4 : integer := 180376;  -- 277.18 Hz
    constant D4  : integer := 170262;  -- 293.66 Hz
    constant DS4 : integer := 160714;  -- 311.13 Hz
    constant E4  : integer := 151686;  -- 329.63 Hz
    constant F4  : integer := 143173;  -- 349.23 Hz
    constant FS4 : integer := 135135;  -- 369.99 Hz
    constant G4  : integer := 127551;  -- 392.00 Hz
    constant GS4 : integer := 120389;  -- 415.30 Hz
    constant A4  : integer := 113636;  -- 440.00 Hz
    constant AS4 : integer := 107258;  -- 466.16 Hz
    constant B4  : integer := 101239;  -- 493.88 Hz
    constant C5  : integer := 95556;   -- 523.25 Hz
    constant CS5 : integer := 90188;   -- 554.37 Hz
    constant D5  : integer := 85131;   -- 587.33 Hz
    constant C6  : integer := 47778;   -- 1046.50 Hz

    signal counter      : integer range 0 to 200000 := 0;
    signal target_limit : integer range 0 to 200000 := 0;
    signal clk_out      : STD_LOGIC := '0';

begin

    -- 1. Приоритетен декодер за 16-те превключвателя (SW15 има най-висок приоритет)
    process(sw)
    begin
        if    (sw(15) = '1') then target_limit <= C6;
        elsif (sw(14) = '1') then target_limit <= D5;
        elsif (sw(13) = '1') then target_limit <= CS5;
        elsif (sw(12) = '1') then target_limit <= C5;
        elsif (sw(11) = '1') then target_limit <= B4;
        elsif (sw(10) = '1') then target_limit <= AS4;
        elsif (sw(9)  = '1') then target_limit <= A4;
        elsif (sw(8)  = '1') then target_limit <= GS4;
        elsif (sw(7)  = '1') then target_limit <= G4;
        elsif (sw(6)  = '1') then target_limit <= FS4;
        elsif (sw(5)  = '1') then target_limit <= F4;
        elsif (sw(4)  = '1') then target_limit <= E4;
        elsif (sw(3)  = '1') then target_limit <= DS4;
        elsif (sw(2)  = '1') then target_limit <= D4;
        elsif (sw(1)  = '1') then target_limit <= CS4;
        elsif (sw(0)  = '1') then target_limit <= C4;
        else                      target_limit <= 0; -- Тихо
        end if;
    end process;

    -- 2. Хардуерен брояч за генериране на квадратната вълна (Clock Divider)
    process(clk_100mhz)
    begin
        if rising_edge(clk_100mhz) then
            if target_limit = 0 then
                counter <= 0;
                clk_out <= '0';
            else
                if counter >= target_limit then
                    counter <= 0;
                    clk_out <= not clk_out;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;

    -- 3. Изход към пина
    audio_out <= clk_out when target_limit > 0 else '0';
