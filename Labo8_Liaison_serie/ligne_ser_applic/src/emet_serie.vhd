-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : emet_serie.vhd
-- Description  : Emetteur pour ligne serie synchrone
-- 
-- Auteur       : Etienne Messerli
-- Date         : 22.05.2018
-- Version      : 0.0
--
-- Utilise      : Labo SysLog2 MSS_cplx, emetteur pour ligne serie synchrone
-- 
--| Modifications |------------------------------------------------------------
-- Version  Date   Auteur     Description
--
-------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity emet_serie is
    generic( N : positive := 4;               -- number of data bits
             VAL_DIV : positive := 20;        -- clock divider for serial clock frequency
             PARITY_CHECK : std_logic := '1'; -- parity check ('1' : check, '0' : do not check)
             TYPE_PAR : boolean := true);     -- parity type  (true = even, false = odd)
    port( clk_i     : in    std_logic;
          reset_i   : in    std_logic;
          start_i   : in    std_logic;   
          data_i    : in    std_logic_vector(N-1 downto 0);
          busy_o    : out   std_logic;
          err_par_o : out   std_logic;
          s_clk_o   : out   std_logic;
          s_data_io : inout std_logic
   );
end emet_serie;

architecture struct of emet_serie is

   --internal signal declaration
   

   --component declaration
   component nom_composant
      port( 
         clk_i            : in     std_logic ;
         reset_i          : in     std_logic ;

         ...
         
         );
   end component;
   for all : nom_composant use entity work.nom_composant(comport); 
  


begin -- Struct







               
end struct;
