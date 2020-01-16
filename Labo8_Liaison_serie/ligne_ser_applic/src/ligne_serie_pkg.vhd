--------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : ligne_serie_pkg.vhd
--
-- Description  : Paquetage pour ligne serie synchrone
-- 
-- Auteur       : Etienne Messerli
-- Date         : 22.05.2018
-- Version      : 0.0
-- 
--| Modifications |------------------------------------------------------------
-- Version  Date   Auteur     Description
--
-------------------------------------------------------------------------------

library ieee;
    use ieee.Std_logic_1164.all;

package ligne_serie_pkg is

    constant NBR_DATA : positive range 1 to 32 := 20;  -- test avec 6 (integration avec 16)
    
    constant FREQ_HORLOGE   : natural := 1000000; -- 1 MHz
    constant FREQ_LGN_SERIE : natural := 50000;   --50 KHz

    -- Arrondi au plus pret: ajout de FREQ_LGN_SERIE/2 a FREQ_HORLOGE avant division 
    constant VAL_DIV : natural := (FREQ_HORLOGE + FREQ_LGN_SERIE/2)/FREQ_LGN_SERIE;

    -- Integer logarithm (rounded up) [MR version]
    function ilogup (x : natural; base : natural := 2) return natural;

end ligne_serie_pkg;


package body ligne_serie_pkg is

    -- Integer logarithm (rounded up) [MR version]
    function ilogup (x : natural; base : natural := 2) return natural is
        variable y : natural := 1;
    begin
        while x > base ** y loop
            y := y + 1;
        end loop;
        return y;
    end ilogup;

end ligne_serie_pkg;
