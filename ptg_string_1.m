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
                  ptv_str = 'Syntéza regulátora';    
              case 3
                  ptv_str = 'Identifikácia';
              case 4
                  ptv_str = 'Nastavenia';                    
              case 5
                  ptv_str = 'Prenosová funkcia';
              case 6
                  ptv_str = 'Chyba!';
              case 7
                  ptv_str = 'Pozor!';
              case 8
                  ptv_str = 'Test Kvality Regulátora';
              case 9
                  ptv_str = 'Identifikácia z vlastných parametrov';
              case 10
                  ptv_str = 'Kritéria kvality';
              case 11
                  ptv_str = 'Načítať dátový súbor';
              case 12
                  ptv_str = 'Normalizácia';
              case 13
                  ptv_str = 'Spracovanie údajov';
              case 14
                  ptv_str = 'Filtrácia';
              case 15
                  ptv_str = 'Uložiť dátový súbor';
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
                  ptv_str = 'Pre možnosť "Vypnúť" a "Reštart" budú všetky premenné vymazané z pamäti a okná pozatvárané!';
              case 2
                  ptv_str = ' Skutočne chcete zadať nové parametre prenosu riadeného systému? Ak áno, všetky ostatné okná sa zatvoria!';
              case 3
                  ptv_str = ' PIDTOOL už bol spustený!';
              case 4
                  ptv_str = 'Parametre PID regulátora:';
              case 5
                  ptv_str = 'Prenos regulovaného systému:';
              case 6
                  ptv_str = 'žiadaná veličina w(t)';
              case 7
                  ptv_str = 'poruchová veličina r(t)';
              case 8
                  ptv_str = 'Parametre simulácie:';
              case 9
                  ptv_str = 'Konštanty pre kritéria kvality:';
              case 10
                  ptv_str = 'Chyba identifikácie:';
              case 11
                  ptv_str = ' PCH';
              case 12
                  ptv_str = 'Zadajte ve¾kosť a čas skokovej zmeny';
              case 13
                  ptv_str = ' Typ filtra';
              case 14
                  ptv_str = ' Dátový súbor bol úspešne uložený!';
              case 15
                  ptv_str = ' Typ modelu:';
              case 16
                  ptv_str = ' Parametre modelu:';
              case 17
                  ptv_str = ' Požadovaný nižší rád n_nižšie:';
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
                  ptv_str = 'Späť';
              case 3
                  ptv_str = 'Syntéza regulátora';
              case 4
                  ptv_str = 'Identifikácia';
              case 5
                  ptv_str = 'Nastavenia';
              case 6
                  ptv_str = 'Vypnúť';
              case 7
                  ptv_str = 'Reštart';
              case 8
                  ptv_str = 'Zavrieť grafy';
              case 9
                  ptv_str = 'Pomoc';
              case 10
                  ptv_str = 'Test Kvality';
              case 11
                  ptv_str = 'Získať prenos';
              case 12
                  ptv_str = 'Identifikácia z vlastných parametrov';
              case 13
                  ptv_str = 'Identifikácia z dátového súboru';
              case 14
                  ptv_str = 'Identifikácia z modelu';
              case 15
                  ptv_str = 'Systém 1. rádu';
              case 16
                  ptv_str = 'Systém n-tého rádu';
              case 17
                  ptv_str = 'Porovnanie';
              case 18
                  ptv_str = 'Identifikácia s nižším rádom';
              case 19
                  ptv_str = 'Normalizácia';
              case 20
                  ptv_str = 'Filtrácia';
              case 21
                  ptv_str = 'Uložiť';
              case 22
                  ptv_str = 'Porovnať';
              case 23
                  ptv_str = 'Zrušiť';
              case 24
                  ptv_str = 'Ladenie identifikácie';
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
                  ptv_str = ' Prenos aperiodického systému | Prenos tlmene kmitavého systému';
              case 2
                  ptv_str = ' Aperiodická | Tlmene kmitavá';
              case 3
                  ptv_str = 'FIR|IIR - Butterworthov|IIR - Cebyšev|IIR - Cebyšev inv.|IIR - eliptický';
              case 4
                  ptv_str = 'dolnopriepustný|hornopriepustný|pásmový záver';
              case 5
                  ptv_str = 'jednoduchý|dvojnásobný';
              case 6
                  ptv_str = ' Všeobecný tvar |Aperiodický | Tlmene kmitavý';
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
                  ptv_str = ' Mriežka';
              case 3
                  ptv_str = ' Kmitavý proces';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI RADIOBUTTON STRING
    %
    case 6
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Experimentálne metódy';
              case 2
                  ptv_str = ' Analytické metódy';
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
                  ptv_str = 'Syntéza regulátora';  
              case 4
                  ptv_str = 'Identifikácia';                  
              case 5
                  ptv_str = 'Filtrácia';
              case 6
                  ptv_str = 'Kvalita regulácie';                  
              case 7
                  ptv_str = 'Vypnúť';
              case 8
                  ptv_str = 'Reštart';
              case 9
                  ptv_str = 'Zavrieť grafy';
              case 10
                  ptv_str = 'Pomoc';
              case 11
                  ptv_str = 'Nastavenia';
              case 12
                  ptv_str = 'Zapnúť efekty';
              case 13
                  ptv_str = 'Vypnúť efekty';
              case 14
                  ptv_str = 'Zobraz výsledky';
              case 15
                  ptv_str = 'Dátum';
              case 16
                  ptv_str = 'čas';
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
                  ptv_str = 'U_Dolná_Hranica =';
              case 25
                  ptv_str = 'U_Horná_Hranica =';
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
                  ptv_str = 'rád filtra =';
              case 49
                  ptv_str = 'omega =';
              case 50
                  ptv_str = 'zvlnenie r =';
              case 51
                  ptv_str = 'Odchýlka filtrácie =';
              case 52
                  ptv_str = 'n_Max =';
              case 53
                  ptv_str = 'Cas_Regulácie';
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
                  ptv_str = ' Zadali ste nekorektné parametre! Vstupom môžu byť len reálne čísla!';
              case 2
                  ptv_str = ' Rád n môže byť len celé kladné číslo!';
              case 3
                  ptv_str = ' Dopravné oneskorenie D je nezáporné číslo!';
              case 4
                  ptv_str = ' Koeficient tlmenia ksi_pe má byť kladné číslo menšie alebo rovné 1!';
              case 5
                  ptv_str = ' Súbor POMOC.HTML nenájdený!';
              case 6
                  ptv_str = ' Parametre regulátora musia byť reálne čísla!';
              case 7
                  ptv_str = ' Cas_Sim nesmie byť záporné číslo!';
              case 8
                  ptv_str = ' W_Cas_Zmeny musí byť kladné číslo!';
              case 9
                  ptv_str = ' R_Cas_Zmeny musí byť kladné číslo!';
              case 10
                  ptv_str = ' Konštanty pre kritéria kvality nesmú byť záporné čísla!';
              case 11
                  ptv_str = ' U_Dolná_Hranica musí byť menšie ako U_Horná_Hranica!';
              case 12
                  ptv_str = ' Presnost_Riadenia musí byť väčšia ako 0 a menšia ako 1!';
              case 13
                  ptv_str = ' Zadali ste nekorektné parametre! Vstupom môže byť len reálny vektor!';
              case 14
                  ptv_str = ' Cas: t_0 < t_D < t_1 < t_2 < Cas_Sim! Alebo čas: t_0 < t_D <  t_Max < t_Min < Cas_Sim!';
              case 15
                  ptv_str = ' Ak je kladné y_Inf, tak y_Min a y_0 musia byť menšie ako y_Max opačne pre záporné y_Inf!';
              case 16
                  ptv_str = 'Regulovaný proces nie je';
              case 17
                  ptv_str = ' rýdzi,';
              case 18
                  ptv_str = ' stabilný,';
              case 19
                  ptv_str = ' na hranici stability,';
              case 20
                  ptv_str = ' riadite¾ný,';
              case 21
                  ptv_str = ' pozorovateľný,';
              case 22
                  ptv_str = ' Znamienko zosilnenia regulátora Z_R je opačné ako zosilnenie procesu K!';
              case 23
                  ptv_str = ' Experimentálne metódy vyžadujú aperiodický model procesu!';
              case 24
                  ptv_str = ' Nie je možné použiť identifikáciu tlmene kmitavého systému! Skúste identifikáciu pod¾a Strejca!';
              case 25
                  ptv_str = ' Vybraný dátový súbor musí mať príponu *.txt or *.dat!';
              case 26
                  ptv_str = ' Vybraný dátový súbor neobsahuje korektné dáta!';
              case 27
                  ptv_str = ' Zadaný čas t_0 nie je v dátovom súbore!';
              case 28
                  ptv_str = ' Omega musí byť vektor 1 alebo 2 prvokov s hodnotou od 0 do 1!';
              case 29
                  ptv_str = ' Rád filtrácie musí byť kladné číslo!';
              case 30
                  ptv_str = ' Hornopriepustný filter vyžaduje omega ako jedno reálne číslo!';
              case 31
                  ptv_str = ' Pásmový záver vyžaduje omega ako dvojprvkový vektor!';
              case 32
                  ptv_str = ' Prvky vektora omega nemôžu byť zhodné!';
              case 33
                  ptv_str = ' Čebyševov filter vyžaduje jednoprvkový vektor zvlnenia r!';
              case 34
                  ptv_str = ' Dvojnásobná filtrácia vyžaduje dátový súbor 3-krát vačší ako rád filtrácie!';
              case 35
                  ptv_str = ' Dátový súbor nebol uložený';
              case 36
                  ptv_str = ' Vektor MEN musí mať viac ako jeden prvok!';
              case 37
                  ptv_str = ' Nie je možné identifikovať s rádom nižším ako 1!';
              case 38
                  ptv_str = ' Rád n_nižšie musí byť nižšie ako n_Max!';
              case 39
                  ptv_str = ' Parameter T_I musí byť kladné reálne číslo!';
              case 40
                  ptv_str = ' Parameter T_D musí byť kladné reálne číslo!';
              case 41
                  ptv_str = ' Parameter T musí byť kladné reálne číslo!';
              case 42
                  ptv_str = ' Parameter T_pe musí byť kladné reálne číslo!';
              case 43
                  ptv_str = ' Uzavretý regulačný obvod je nestabilný!';
              case 44
                  ptv_str = ' Uzavretý regulačný obvod je na hranici stability!';
              case 45
                  ptv_str = ' Parameter b_W musí byť väčšia ako 0!';
              case 46
                  ptv_str = ' Touto metódou nie je možné navrhnúť regulátor pre zadané parametre modelu procesu!';
              case 47
                  ptv_str = ' V prípade návrhu PID alebo PD regulátora dopravné oneskorenie D musí byť kladné číslo!';
              case 48
                  ptv_str = ' Požaduje sa rád n menší ako 9!';
              case 49
                  ptv_str = ' Funkcia EXPORTFIG nenájdená!';  
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end


    % GUI PLOT STRING
    %
    case 10
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Spätnoväzbová prechodová charakteristika';
              case 2
                  ptv_str = ' Regulačný vstup';
              case 3
                  ptv_str = ' čas t';
              case 4
                  ptv_str = ' Výstupná veličina y(t)';
              case 5
                  ptv_str = ' Akčná veličina u(t)';
              case 6
                  ptv_str = ' OV y(t) bez obmedzení na MV u(t)';
              case 7
                  ptv_str = ' OV y(t) po obmedzení MV u(t)';
              case 8
                  ptv_str = ' Horná hranica OV y(t)';
              case 9
                  ptv_str = ' Dolná hranica OV y(t)';
              case 10
                  ptv_str = ' žiadaná veličina w(t)';
              case 11
                  ptv_str = ' MV u(t) bez obmedzení';
              case 12
                  ptv_str = ' MV u(t) pred obmedzením';
              case 13
                  ptv_str = ' MV u(t) po obmedzení';
              case 14
                  ptv_str = 'Výsledok identifikácie';
              case 15
                  ptv_str = 'Údaje načítané z dátového súboru';
              case 16
                  ptv_str = 'Prechodová charakteristika';
              case 17
                  ptv_str = 'Pôvodný výstup';
              case 18
                  ptv_str = 'Výstup z filtrácie';
              case 19
                  ptv_str = 'Porovnanie prechodových charakteristík';
              case 20
                  ptv_str = 'Porovnávaný výstup';
              case 21
                  ptv_str = 'Model s nižším rádom';
              case 22
                  ptv_str = 'Normalizovaný výstup';
              case 23
                  ptv_str = 'Nominálny výstup';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % PTC - CONTROLER TUNING TEXT
    %
    case 11
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Zieglerova - Nicholsova metóda|Strejcova metóda|Cohenova - Coonova metóda|Chienova - Hronesova - Reswickova metóda (0% prereg.)|Chienova - Hronesova - Reswickova metóda (20% prereg.)|Minimum ITAE metóda (úloha regulácie)|Lopezova IAE-ISE metóda';
              case 2
                  ptv_str = 'Zieglerova - Nicholsova metóda|Strejcova metóda|Cohenova - Coonova metóda|Metóda priamej syntézy regulátora|Haalmanova metóda|Chienova - Hronesova - Reswickova metóda (0% prereg.)|Chienova - Hronesova - Reswickova metóda (20% prereg.)|Metóda polovičného útlmu|Riverova - Morariho metóda|Riverova - Morariho metóda (zlepšené)|Minimum IAE metóda|Minimum ITAE metóda|Lopezova IAE-ISE metóda|Astromova - Hagglundova metóda (Ms = 1.4)|Astromova - Hagglundova metóda (Ms = 2.0)';
              case 3
                  ptv_str = 'Zieglerova - Nicholsova metóda|Strejcova metóda |Cohenova - Coonova metóda|Metóda priamej syntézy regulátora|Chienova - Hronesova - Reswickova metóda (0% prereg.)|Chienova - Hronesova - Reswickova metóda (20% prereg.)|Metóda polovičného útlmu|Riverova - Morariho metóda|Minimum IAE metóda|Minimum ITAE metóda|Lopezova IAE-ISE metóda|Astromova - Hagglundova metóda (Ms = 1.4)|Astromova - Hagglundova metóda (Ms = 2.0)';
              case 4
                  ptv_str = 'Cohenova - Coonova metóda';
              case 5
                  ptv_str = 'Metóda umiestnenia polov|Naslinova metóda';
              case 6
                  ptv_str = 'Metóda umiestnenia polov|Naslinova metóda|Metóda zalozená na bezpečnosti v zosilnení a vo fáze|Metóda požadovaného modelu|Metóda násobného dominantného polu|Metóda optimálneho modulu';
              case 7
                  ptv_str = 'Metóda umiestnenia pólov|Naslinova metóda|Metóda zalozená na bezpečnosti v zosilnení a vo fáze|Metóda požadovaného modelu|Metóda násobného dominantného polu|Metóda optimálneho modulu';
              case 8
                  ptv_str = 'Metóda umiestnenia pólov|Naslinova metóda';
              case 9
                  ptv_str = ' Rád n musí byť väčší ako 1!';
              case 10
                  ptv_str = ' Rád n musí byť väčší ako 2!';
              case 11
                  ptv_str = ' Časová konštanta uzavretého reg. obvodu T_URO < Tn';
              case 12
                  ptv_str = 'T_URO = ';
              case 13
                  ptv_str = ' Riadenie na žiadanú hodnotu';
              case 14
                  ptv_str = ' Odstraňovanie vplyvu poruchy';
              case 15
                  ptv_str = ' Časová konštanta URO T_URO>0.2*Tn a T_URO>1.7*Tu';
              case 16
                  ptv_str = ' Maximálne preregulovanie:';
              case 17
                  ptv_str = ' 0%| 5%| 10%| 15%| 20%| 25%| 30%| 35%| 40%| 45%| 50%';
              case 18
                  ptv_str = ' Časová konštanta uzavretého reg. obvodu T_URO>0.2Tn a (T_URO/Tu)>0.25';
              case 19
                  ptv_str = ' 1 %| 3 %| 5 %| 8 %| 12 %| 16 %| 20 %';
              case 20
                  ptv_str = ' Parametre referenčného prenosu:';
              case 21
                  ptv_str = ' Referenčný polynom:';
              case 22
                  ptv_str = ' Vlastný| Binomický| Butterworthov| Minimum t(5%)| Minimum kritéria ITAE';
              case 23
                  ptv_str = 'ksi_0 =';
              case 24
                  ptv_str = 'w_0 =';
              case 25
                  ptv_str = ' Zadaný pol w_0 je nestabilný!';
              case 26
                  ptv_str = 'S_0 = ';
              case 27
                  ptv_str = 'Dopočítal sa nestabilný pol!';
              case 28
                  ptv_str = 'Dopočítal sa stabilný pol!';
              case 29
                  ptv_str = ' Rád n musí byť 2 alebo 3!';
              case 30
                  ptv_str = ' Požaduje sa aperiodický model druhého rádu!';
              case 31
                  ptv_str = ' Metóda požaduje dopravné oneskorenie D ako kladné číslo!';
              case 32
                  ptv_str = ' Rád n musí byť 1!';
              case 33
                  ptv_str = 'Zadajte bezpečnosť v zosilnení Gm a vo fáze Pm:';
              case 34
                  ptv_str = 'Gm [dB]';
              case 35
                  ptv_str = 'Pm [deg]';
              case 36
                  ptv_str = ' Bezpečnosť v zosilnení Gm musí byť väčšia ako 1!';
              case 37
                  ptv_str = ' Pre daný model procesu nie je možné navrhnúť regulátor pomocou vybranej metódy!';
              case 38
                  ptv_str = ' Rád n musí byť 3!';
              case 39
                  ptv_str = ' Požaduje sa aperiodický model!';
              case 40
                  ptv_str = ' Pri syntéze PID regulátora sa očakáva model procesu 2. rádu!';
              case 41
                  ptv_str = ' Koeficient tlmenia ksi_pe má byť väčší ako 0.71!';
              case 42
                  ptv_str = ' Koeficient tlmenia ksi_pe má byť väčší ako 0.5!';
              case 43
                  ptv_str = ' Rád n musí byť menší ako 3!';
              case 44
                  ptv_str = ' Táto metóda požaduje Tu > 0!';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

% ------------------- %

    otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
  end