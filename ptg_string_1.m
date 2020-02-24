% PTG_STRING_1
%
%   ptv_str=ptg_string_1(ptv_str_cat,ptv_str_num)
%
%   ptv_str = output string
%   ptv_str_cat = input category of string
%   ptv_str_num = input number of string
%
%   GUI function PTG_STRING_1 is called from PTF_STRING
%   PTG_STRING_1 returns required string for GUI figures and uicontrol
%   objects in Slovak
%   In case required string cannot be found in Slovak, function PTG_STRING_0
%   is called to return required string in English

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk

% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------

function ptv_str=ptg_string_1(ptv_str_cat,ptv_str_num)

switch ptv_str_cat

    % LANGUAGE
    case 0
        switch ptv_str_num
            otherwise
                ptv_str = 'SK - Slovak';
        end

    % GUI FIGURE TITLE STRING
    %    
    case 1
    
          switch ptv_str_num
              case 1
                  ptv_str = 'PIDDESIGN';
              case 2
                  ptv_str = 'SyntÈza regul·tora';    
              case 3
                  ptv_str = 'Identifik·cia';
              case 4
                  ptv_str = 'Nastavenia';                    
              case 5
                  ptv_str = 'Prenosov· funkcia';
              case 6
                  ptv_str = 'Chyba!';
              case 7
                  ptv_str = 'Pozor!';
              case 8
                  ptv_str = 'Test Kvality Regul·tora';
              case 9
                  ptv_str = 'Identifik·cia z vlastn˝ch parmetrov';
              case 10
                  ptv_str = 'KritÈria kvality';
              case 11
                  ptv_str = 'NaËÌtaù d·tov˝ s˙bor';
              case 12
                  ptv_str = 'Normaliz·cia';
              case 13
                  ptv_str = 'Spracovanie ˙dajov';
              case 14
                  ptv_str = 'Filtr·cia';
              case 15
                  ptv_str = 'Uloûiù d·tov˝ s˙bor';
              case 16
                  ptv_str = 'Porovnanie';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
          end

    % GUI TEXT STRING
    %
    case 2
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Pre moûnosù "Vypn˙ù" a "Reötart" bud˙ vöetky premennÈ vymazanÈ z pam‰ti a okn· pozatv·rane!';
              case 2
                  ptv_str = ' SkutoËne chcete zadaù novÈ parametre prenosu riadenÈho systÈmu? Ak ·no, vöetky ostatnÈ okn· sa zatvoria!';
              case 3
                  ptv_str = ' PIDTOOL uû bol spusten˝!';
              case 4
                  ptv_str = 'Parametre PID regul·tora:';
              case 5
                  ptv_str = 'Prenos regulovanÈho systÈmu:';
              case 6
                  ptv_str = 'ûiadan· veliËina w(t)';
              case 7
                  ptv_str = 'poruchov· veliËina r(t)';
              case 8
                  ptv_str = 'Parametre simul·cie:';
              case 9
                  ptv_str = 'Konötanty pre kritÈria kvality:';
              case 10
                  ptv_str = 'Chyba identifik·cie:';
              case 11
                  ptv_str = ' PCH';
              case 12
                  ptv_str = 'Zadajte veækosù a Ëas skokovej zmeny';
              case 13
                  ptv_str = ' Typ filtra';
              case 14
                  ptv_str = ' D·tov˝ s˙bor bol ˙speöne uloûen˝!';
              case 15
                  ptv_str = ' Typ modelu:';
              case 16
                  ptv_str = ' Parametre modelu:';
              case 17
                  ptv_str = ' Poûadovan˝ niûöÌ r·d n_niûöie:';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI BUTTON STRING
    %           
    case 3
        
          switch ptv_str_num
              case 1
                  ptv_str = 'OK';
              case 2
                  ptv_str = 'Sp‰ù';
              case 3
                  ptv_str = 'SyntÈza regul·tora';
              case 4
                  ptv_str = 'Identifik·cia';
              case 5
                  ptv_str = 'Nastavenia';
              case 6
                  ptv_str = 'Vypn˙ù';
              case 7
                  ptv_str = 'Reötart';
              case 8
                  ptv_str = 'Zavrieù grafy';
              case 9
                  ptv_str = 'Pomoc';
              case 10
                  ptv_str = 'Test Kvality';
              case 11
                  ptv_str = 'ZÌskaù prenos';
              case 12
                  ptv_str = 'Identifik·cia z vlastn˝ch parametrov';
              case 13
                  ptv_str = 'Identifik·cia z d·tovÈho s˙boru';
              case 14
                  ptv_str = 'Identifik·cia z modelu';
              case 15
                  ptv_str = 'SystÈm 1. r·du';
              case 16
                  ptv_str = 'SystÈm n-tÈho r·du';
              case 17
                  ptv_str = 'Porovnanie';
              case 18
                  ptv_str = 'Identifik·cia s niûöÌm r·dom';
              case 19
                  ptv_str = 'Normaliz·cia';
              case 20
                  ptv_str = 'Filtr·cia';
              case 21
                  ptv_str = 'Uloûiù';
              case 22
                  ptv_str = 'Porovnaù';
              case 23
                  ptv_str = 'Zruöiù';
              case 24
                  ptv_str = 'Ladenie identifik·cie';
              case 25
                  ptv_str = 'Prec+';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI POPUP STRING
    %
    case 4
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Prenos aperiodickÈho systÈmu | Prenos tlmene kmitavÈho systÈmu';
              case 2
                  ptv_str = ' Aperiodick· | Tlmene kmitav·';
              case 3
                  ptv_str = 'FIR|IIR - Butterworthov|IIR - Cebyöev|IIR - Cebyöev inv.|IIR - eliptick˝';
              case 4
                  ptv_str = 'dolnopriepustn˝|hornopriepustn˝|p·smov˝ z·ver';
              case 5
                  ptv_str = 'jednoduch˝|dvojn·sobn˝';
              case 6
                  ptv_str = ' Vöeobecn˝ tvar |Aperiodick˝ | Tlmene kmitav˝';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI CHECKBOX STRING
    %
    case 5
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Legenda';
              case 2
                  ptv_str = ' Mrieûka';
              case 3
                  ptv_str = ' Kmitav˝ proces';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI RADIOBUTTON STRING
    %
    case 6
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Experiment·lne methody';
              case 2
                  ptv_str = ' AnalytickÈ methody';
              case 3
                  ptv_str = ' P';
              case 4
                  ptv_str = ' PI';
              case 5
                  ptv_str = ' PID';
              case 6
                  ptv_str = ' PD';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI UIMENU STRING
    %
    case 7
        
          switch ptv_str_num
              case 1
                  ptv_str = 'PIDTOOL';
              case 2
                  ptv_str = 'Jazyk';
              case 3
                  ptv_str = 'SyntÈza regul·tora';  
              case 4
                  ptv_str = 'Identification';                  
              case 5
                  ptv_str = 'Filtr·cia';
              case 6
                  ptv_str = 'Kvalita regul·cie';                  
              case 7
                  ptv_str = 'Vypn˙ù';
              case 8
                  ptv_str = 'Reötart';
              case 9
                  ptv_str = 'Zavrieù grafy';
              case 10
                  ptv_str = 'Pomoc';
              case 11
                  ptv_str = 'Nastavenia';
              case 12
                  ptv_str = 'Zapn˙ù efekty';
              case 13
                  ptv_str = 'Vypn˙ù efekty';
              case 14
                  ptv_str = 'Zobraz v˝sledky';
              case 15
                  ptv_str = 'D·tum';
              case 16
                  ptv_str = '»as';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI INPUT STRING
    %
    case 8
          switch ptv_str_num
              case 1
                  ptv_str = 'n =';
              case 2
                  ptv_str = 'K =';
              case 3
                  ptv_str = 'T =';
              case 4
                  ptv_str = 'D =';
              case 5
                  ptv_str = 'Tu =';
              case 6
                  ptv_str = 'Tn =';
              case 7
                  ptv_str = 'T_pe =';
              case 8
                  ptv_str = 'ksi_pe =';
              case 9
                  ptv_str = 'D_pe =';
              case 10
                  ptv_str = 'Z_R =';
              case 11
                  ptv_str = 'T_I =';
              case 12
                  ptv_str = 'T_D =';
              case 13
                  ptv_str = 'T_R =';
              case 14
                  ptv_str = 'CIT =';
              case 15
                  ptv_str = 'MEN =';
              case 16
                  ptv_str = 'W_Povodna =';
              case 17
                  ptv_str = 'W_Nova =';
              case 18
                  ptv_str = 'W_Cas_Zmeny =';
              case 19
                  ptv_str = 'R_Povodna =';
              case 20
                  ptv_str = 'R_Nova =';
              case 21
                  ptv_str = 'R_Cas_Zmeny =';
              case 22
                  ptv_str = 'Presnost_Riadenia =';
              case 23
                  ptv_str = 'Cas_Sim =';
              case 24
                  ptv_str = 'U_Doln·_Hranica =';
              case 25
                  ptv_str = 'U_Horn·_Hranica =';
              case 26
                  ptv_str = 'Q_u pre ISE_u =';
              case 27
                  ptv_str = 'Q_du pre ISE_du =';
              case 28
                  ptv_str = 'Q_de pre ISE_de =';
              case 29
                  ptv_str = 'u_0 =';
              case 30
                  ptv_str = 'u_Inf =';
              case 31
                  ptv_str = 'y_0 =';
              case 32
                  ptv_str = 'y_Max =';
              case 33
                  ptv_str = 'y_Min =';
              case 34
                  ptv_str = 'y_Inf =';
              case 35
                  ptv_str = 't_0 =';
              case 36
                  ptv_str = 't_1 =';
              case 37
                  ptv_str = 't_2 =';
              case 38
                  ptv_str = 't_D =';
              case 39
                  ptv_str = 't_Max =';
              case 40
                  ptv_str = 't_Min =';
              case 41
                  ptv_str = 'IAE =';
              case 42
                  ptv_str = 'ISE =';
              case 43
                  ptv_str = 'ITSE =';
              case 44
                  ptv_str = 'ISE_u =';
              case 45
                  ptv_str = 'ISE_du =';
              case 46
                  ptv_str = 'ISE_de =';
              case 47
                  ptv_str = 'delta_u =';
              case 48
                  ptv_str = 'r·d filtra =';
              case 49
                  ptv_str = 'omega =';
              case 50
                  ptv_str = 'zvlnenie r =';
              case 51
                  ptv_str = 'Odch˝lka filtr·cie =';
              case 52
                  ptv_str = 'n_Max =';
              case 53
                  ptv_str = 'Cas_Regul·cie';
              case 54
                  ptv_str = 'Preregulovanie';
              case 55
                  ptv_str = 'ITAE =';
              case 56
                  ptv_str = 'ISTAE =';
              case 57
                  ptv_str = 'ISTSE =';
              case 58
                  ptv_str = 'b_W =';
              case 59
                  ptv_str = 'T_F =';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI ERROR STRING
    %
    case 9
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Zadali ste nekorektnÈ parametre! Vstupom mÙûu byù len re·lne ËÌsla!';
              case 2
                  ptv_str = ' R·d n mÙûe byù len celÈ kladnÈ ËÌslo!';
              case 3
                  ptv_str = ' DopravnÈ oneskorenie D je nez·pornÈ ËÌslo!';
              case 4
                  ptv_str = ' Koeficient tlmenia ksi_pe m· byù kladnÈ ËÌslo menöie alebo rovnÈ 1!';
              case 5
                  ptv_str = ' S˙bor POMOC.HTML nen·jden˝!';
              case 6
                  ptv_str = ' Parametre regul·tora musia byù re·lne ËÌsla!';
              case 7
                  ptv_str = ' Cas_Sim nesmie byù z·pornÈ ËÌslo!';
              case 8
                  ptv_str = ' W_Cas_Zmeny musÌ byù kladnÈ ËÌslo!';
              case 9
                  ptv_str = ' R_Cas_Zmeny musÌ byù kladnÈ ËÌslo!';
              case 10
                  ptv_str = ' Konötanty pre kritÈria kvality nesm˙ byù z·pornÈ ËÌsla!';
              case 11
                  ptv_str = ' U_Doln·_Hranica musÌ byù menöie ako U_Horn·_Hranica!';
              case 12
                  ptv_str = ' Presnost_Riadenia musÌ byù v‰Ëöia ako 0 a menöia ako 1!';
              case 13
                  ptv_str = ' Zadali ste nekorektnÈ parametre! Vstupom mÙûe byù len re·lny vektor!';
              case 14
                  ptv_str = ' Cas: t_0 < t_D < t_1 < t_2 < Cas_Sim! Alebo Ëas: t_0 < t_D <  t_Max < t_Min < Cas_Sim!';
              case 15
                  ptv_str = ' Ak je kladnÈ y_Inf, tak y_Min a y_0 musia byù menöie ako y_Max opaËne pre z·pornÈ y_Inf!';
              case 16
                  ptv_str = 'Regulovan˝ proces nie je';
              case 17
                  ptv_str = ' r˝dzi,';
              case 18
                  ptv_str = ' stabiln˝,';
              case 19
                  ptv_str = ' na hranici stability,';
              case 20
                  ptv_str = ' riaditeæn˝,';
              case 21
                  ptv_str = ' pozorovateæn˝,';
              case 22
                  ptv_str = ' Znamienko zosilnenia regul·tora Z_R je opaËnÈ ako zosilnenie procesu K!';
              case 23
                  ptv_str = ' Experiment·lne metody vyûaduj˙ aperiodick˝ model procesu!';
              case 24
                  ptv_str = ' Nie je moûnÈ pouûiù identifik·ciu tlmene kmitavÈho systÈmu! Sk˙ste identifik·ciu podæa Strejca!';
              case 25
                  ptv_str = ' Vybran˝ d·tov˝ s˙bor musÌ maù prÌponu *.txt or *.dat!';
              case 26
                  ptv_str = ' Vybran˝ d·tov˝ s˙bor neobsahuje korektnÈ d·ta!';
              case 27
                  ptv_str = ' Zadan˝ Ëas t_0 nie je v d·tovom s˙bore!';
              case 28
                  ptv_str = ' Omega musÌ byù vektor 1 alebo 2 prvokov s hodnotou od 0 do 1!';
              case 29
                  ptv_str = ' R·d filtr·cie musÌ byù kladnÈ ËÌslo!';
              case 30
                  ptv_str = ' Hornopriepustn˝ filter vyûaduje omega ako jedno re·lne ËÌslo!';
              case 31
                  ptv_str = ' P·smov˝ z·ver vyûaduje omega ako dvojprvkov˝ vektor!';
              case 32
                  ptv_str = ' Prvky vektora omega nemÙûu byù zhodnÈ!';
              case 33
                  ptv_str = ' Cebyöevov filter vyûaduje jednoprvkov˝ vektor zvlnenia r!';
              case 34
                  ptv_str = ' Dvojn·sobn· filtr·cia vyûaduje d·tov˝ s˙bor 3-kr·t vaËöÌ ako r·d filtr·cie!';
              case 35
                  ptv_str = ' D·tov˝ s˙bor nebol uloûen˝';
              case 36
                  ptv_str = ' Vektor MEN musÌ maù viac ako jeden prvok!';
              case 37
                  ptv_str = ' Nie je moûnÈ identifikovaù s r·dom niûöÌm ako 1!';
              case 38
                  ptv_str = ' R·d n_niûöie musÌ byù niûöie ako n_Max!';
              case 39
                  ptv_str = ' Parameter T_I musÌ byù kladnÈ re·lne ËÌslo!';
              case 40
                  ptv_str = ' Parameter T_D musÌ byù kladnÈ re·lne ËÌslo!';
              case 41
                  ptv_str = ' Parameter T musÌ byù kladnÈ re·lne ËÌslo!';
              case 42
                  ptv_str = ' Parameter T_pe musÌ bzù kladnÈ re·lne ËÌslo!';
              case 43
                  ptv_str = ' Uzavret˝ regulaËn˝ obvod je nestabiln˝!';
              case 44
                  ptv_str = ' Uzavret˝ regulaËn˝ obvod je na hranici stability!';
              case 45
                  ptv_str = ' Parameter b_W musÌ byù v‰Ëöia ako 0!';
              case 46
                  ptv_str = ' Touto metodou nie je moûnÈ navrhn˙ù regul·tor pre zadanÈ parametre modelu procesu!';
              case 47
                  ptv_str = ' V prÌpade n·vrhu PID alebo PD regul·tora dopravnÈ oneskorenie D musÌ byù kladnÈ ËÌslo!';
              case 48
                  ptv_str = ' Poûaduje sa r·d n menöÌ ako 9!';
              case 49
                  ptv_str = ' Funkcia EXPORTFIG nen·jden·!';  
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end


    % GUI PLOT STRING
    %
    case 10
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Sp‰tnov‰zbov· prechodov· charakteristika';
              case 2
                  ptv_str = ' RegulaËn˝ vstup';
              case 3
                  ptv_str = ' cas t';
              case 4
                  ptv_str = ' V˝stupn· velicina y(t)';
              case 5
                  ptv_str = ' Akcn· velicina u(t)';
              case 6
                  ptv_str = ' OV y(t) bez obmedzenÌ na MV u(t)';
              case 7
                  ptv_str = ' OV y(t) po obmedzenÌ MV u(t)';
              case 8
                  ptv_str = ' Horn· hranica OV y(t)';
              case 9
                  ptv_str = ' Doln· hranica OV y(t)';
              case 10
                  ptv_str = ' ûiadan· velicina w(t)';
              case 11
                  ptv_str = ' MV u(t) bez obmedzenÌ';
              case 12
                  ptv_str = ' MV u(t) pred obmedzenÌm';
              case 13
                  ptv_str = ' MV u(t) po obmedzenÌ';
              case 14
                  ptv_str = 'V˝sledok identifik·cie';
              case 15
                  ptv_str = 'Udaje nacÌtanÈ z d·tovÈho s˙boru';
              case 16
                  ptv_str = 'Prechodov· charakteristika';
              case 17
                  ptv_str = 'PÙvodn˝ v˝stup';
              case 18
                  ptv_str = 'V˝stup z filtr·cie';
              case 19
                  ptv_str = 'Porovnanie prechodov˝ch charakteristÌk';
              case 20
                  ptv_str = 'Porovn·van˝ v˝stup';
              case 21
                  ptv_str = 'Model s niûöÌm r·dom';
              case 22
                  ptv_str = 'Normalizovan˝ v˝stup';
              case 23
                  ptv_str = 'Nomin·lny v˝stup';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % PTC - CONTROLER TUNING TEXT
    %
    case 11
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda|Cohenova - Coonova metoda|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Minimum ITAE metoda (˙loha regul·cie)|Lopezova IAE-ISE metoda';
              case 2
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda|Cohenova - Coonova metoda|Metoda priamej syntÈzy regul·tora|Haalmanova metoda|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Metoda poloviËnÈho ˙tlmu|Riverova - Morariho metoda|Riverova - Morariho metoda (zlepöenÈ)|Minimum IAE metoda|Minimum ITAE metoda|Lopezova IAE-ISE metoda|Astromova - Hagglundova metoda (Ms = 1.4)|Astromova - Hagglundova metoda (Ms = 2.0)';
              case 3
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda |Cohenova - Coonova metoda|Metoda priamej syntÈzy regul·tora|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Metoda poloviËnÈho ˙tlmu|Riverova - Morariho metoda|Minimum IAE metoda|Minimum ITAE metoda|Lopezova IAE-ISE metoda|Astromova - Hagglundova metoda (Ms = 1.4)|Astromova - Hagglundova metoda (Ms = 2.0)';
              case 4
                  ptv_str = 'Cohenova - Coonova metoda';
              case 5
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda';
              case 6
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda|Metoda zalozen· na bezpeËnosti v zosilnenÌ a vo f·ze|Metoda poûadovanÈho modelu|Metoda n·sobnÈho dominantnÈho polu|Metoda optim·lneho modulu';
              case 7
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda|Metoda zalozen· na bezpeËnosti v zosilnenÌ a vo f·ze|Metoda poûadovanÈho modelu|Metoda n·sobnÈho dominantnÈho polu|Metoda optim·lneho modulu';
              case 8
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda';
              case 9
                  ptv_str = ' R·d n musÌ byù v‰ËöÌ ako 1!';
              case 10
                  ptv_str = ' R·d n musÌ byù v‰ËöÌ ako 2!';
              case 11
                  ptv_str = ' Casov· konötanta uzavretÈho reg. obvodu T_URO < Tn';
              case 12
                  ptv_str = 'T_URO = ';
              case 13
                  ptv_str = ' Riadenie na ûiadan˙ hodnotu';
              case 14
                  ptv_str = ' OdstraÚovanie vplyvu poruchy';
              case 15
                  ptv_str = ' Casov· konötanta URO T_URO>0.2*Tn a T_URO>1.7*Tu';
              case 16
                  ptv_str = ' Maxim·lne preregulovanie:';
              case 17
                  ptv_str = ' 0%| 5%| 10%| 15%| 20%| 25%| 30%| 35%| 40%| 45%| 50%';
              case 18
                  ptv_str = ' Casov· konötanta uzavretÈho reg. obvodu T_URO>0.2Tn a (T_URO/Tu)>0.25';
              case 19
                  ptv_str = ' 1 %| 3 %| 5 %| 8 %| 12 %| 16 %| 20 %';
              case 20
                  ptv_str = ' Parametre referenËnÈho prenosu:';
              case 21
                  ptv_str = ' ReferenËn˝ polynom:';
              case 22
                  ptv_str = ' Vlastn˝| Binomick˝| Butterworthov| Minimum t(5%)| Minimum kritÈria ITAE';
              case 23
                  ptv_str = 'ksi_0 =';
              case 24
                  ptv_str = 'w_0 =';
              case 25
                  ptv_str = ' Zadan˝ pol w_0 je nestabiln˝!';
              case 26
                  ptv_str = 'S_0 = ';
              case 27
                  ptv_str = 'DopoËÌtal sa nestabiln˝ pol!';
              case 28
                  ptv_str = 'DopoËÌtal sa stabiln˝ pol!';
              case 29
                  ptv_str = ' R·d n musÌ byù 2 alebo 3!';
              case 30
                  ptv_str = ' Poûaduje sa aperiodick˝ model druhÈho r·du!';
              case 31
                  ptv_str = ' Metoda poûaduje dopravnÈ oneskorenie D ako kladnÈ ËÌslo!';
              case 32
                  ptv_str = ' R·d n musÌ byù 1!';
              case 33
                  ptv_str = 'Zadajte bezpeËnosù v zosilnenÌ Gm a vo f·ze Pm:';
              case 34
                  ptv_str = 'Gm [dB]';
              case 35
                  ptv_str = 'Pm [deg]';
              case 36
                  ptv_str = ' BezpeËnosù v zosilnenÌ Gm musÌ byù v‰Ëöia ako 1!';
              case 37
                  ptv_str = ' Pre dan˝ model procesu nie je moûnÈ navrhn˙ù regul·tor pomocou vybranej metody!';
              case 38
                  ptv_str = ' R·d n musÌ byù 3!';
              case 39
                  ptv_str = ' Poûaduje sa aperiodick˝ model!';
              case 40
                  ptv_str = ' Pri syntÈze PID regul·tora sa oËak·va model procesu 2. r·du!';
              case 41
                  ptv_str = ' Koeficient tlmenia ksi_pe m· byù v‰ËöÌ ako 0.71!';
              case 42
                  ptv_str = ' Koeficient tlmenia ksi_pe m· byù v‰ËöÌ ako 0.5!';
              case 43
                  ptv_str = ' R·d n musÌ byù menöÌ ako 3!';
              case 44
                  ptv_str = ' T·to metoda poûaduje Tu > 0!';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

% ------------------- %

    otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
  end