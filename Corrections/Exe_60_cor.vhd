-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenerie et de Gestion du Canton de Vaud
-- Institut REDS
--
-- Fichier :  Exo_FctComb_60.vhd
-- Auteur  :  E. Messerli
-- Date    :  22.02.2018
--
-- Utilise dans :  Exercice 60 fct combinatoire
-----------------------------------------------------------------------
-- Ver    Date     Qui  Commentaires
-- 1.0  10.03.2019 EMI  Commentaires/corrections solutions proposées
--                      par les étudiants  
-----------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity Exo_FctComb_60 is
  port(temp_ok_1_i  : in  std_logic;  -- thermostat étage 1 (1 = temp. suffis.)
       temp_ok_2_i  : in  std_logic;  --                  2
       temp_ok_3_i  : in  std_logic;  --                  3
       p_ouvert_i   : in  std_logic;  -- détec. porte ouverte (1 = ouverte)
       vanne_1_o    : out std_logic;  -- vanne étage 1
       vanne_2_o    : out std_logic;  --             2
       vanne_3_o    : out std_logic;  --             3
       souffle_o    : out std_logic;  -- soufflerie porte
       pompe_o      : out std_logic;
       t_normal_o   : out std_logic;
       t_chaud_o    : out std_logic
       );
end Exo_FctComb_60 ;

--Version Alexandre Rey
architecture Flot_Don of Exo_FctComb_60 is
  --declaration des signaux internes
  signal temp_3etages  : std_logic_vector(2 downto 0);
  signal t_normal_s    : std_logic;

  --utiliser un signal intermediaire. EMI
    signal temp_all_ok_s : std_logic;

begin

  temp_3etages  <= temp_ok_1_i & temp_ok_2_i & temp_ok_3_i;
  temp_all_ok_s <= temp_ok_1_i and temp_ok_2_i and temp_ok_3_i; --EMI
  
  -- vanne ouverte si temp. insuffisante :
  vanne_1_o <= '1' when temp_ok_1_i = '0' else '0';
  vanne_2_o <= '1' when temp_ok_2_i = '0' else '0';
  vanne_3_o <= '1' when temp_ok_3_i = '0' else '0';

--   -- soufflerie
--   --  EMI: utilisation inutile de l'instruction when...else
--   souffle_o <= '1' when p_ouvert_i = '1' and
--                         (temp_ok_1_i = '0' or
--                          temp_ok_2_i = '0' or
--                           temp_ok_3_i = '0')  else
--                '0';
   --description simple à l'aide de l'équation logique:
    souffle_o <= p_ouvert_i and  (not temp_ok_1_i or not temp_ok_2_i or not temp_ok_3_i);
    --avec signal intermediaire. Plus lisible. EMI
    --souffle_o <= p_ouvert_i and not temp_all_ok_s;
             

--   -- pompe de circulation
--   -- utilisation inutile de l'instruction when ... else
--   pompe_o <= '0' when temp_ok_1_i = '1'
--                   and temp_ok_2_i = '1'
--                   and temp_ok_3_i = '1' else
--              '1';
   pompe_o <= not temp_all_ok_s;

   -- sélect. temp.
   with temp_3etages select
     t_normal_s <= '1' when "001",
                   '1' when "010",
                   '1' when "100",
                   '0' when others;
   t_normal_o <= t_normal_s;
 
   --utilisation when...else inutile. Il s'agit d'un simple inverseur. EMI
   --t_chaud_o <= '0' when t_normal_s = '1' else '1';
   t_chaud_o <= not t_normal_s;  --description simple et lisible. EMI

end Flot_Don;

architecture Flot_Don_2 of Exo_FctComb_60 is
  --declaration des signaux internes
  -- Version Della Luce
  
  --Manque des commentaires. Voir la correction de Rey
  --Utilisation non pertinente de l'instruction when...else
  --Chercher des descriptions simples => des lors lisible.  

   signal t_normal_s    : std_logic;

begin

  --Utilisation non pertinente de l'instruction wheen...else. EMI
  --Voir solution precedente
  vanne_1_o <= '1' when not temp_ok_1_i = '1' else '0';
  vanne_2_o <= '1' when not temp_ok_2_i = '1' else '0';
  vanne_3_o <= '1' when not temp_ok_3_i = '1' else '0';
  
  --voir correction Rey
  souffle_o <= '1' when (p_ouvert_i and not(temp_ok_1_i and temp_ok_2_i and temp_ok_3_i)) = '1' else '0';
  
  pompe_o <= '0' when (temp_ok_1_i = '1') and (temp_ok_2_i = '1') and (temp_ok_3_i = '1') else '1';
  
  t_normal_s <= '1' when (not temp_ok_1_i and temp_ok_2_i and temp_ok_3_i) = '1'
                      or (temp_ok_1_i and not temp_ok_2_i and temp_ok_3_i) = '1'
                      or (temp_ok_1_i and not temp_ok_2_i and temp_ok_3_i) = '1' else
                '0';
  
  t_normal_o <= t_normal_s;

  --Impoossible de relire une sortie. Creer un signal intermediaire
  --L'equation est un simple inverseur!
  --t_chaud_o <= '1' when not (t_normal_o = '1') else '0';
  t_chaud_o <= not t_normal_s;

end Flot_Don_2;

