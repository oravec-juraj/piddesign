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
                  ptv_str = 'PIDTOOL';
              case 2
                  ptv_str = 'Synt�a regul�ora';    
              case 3
                  ptv_str = 'Identifik�ia';
              case 4
                  ptv_str = 'Nastavenia';                    
              case 5
                  ptv_str = 'Prenosov�funkcia';
              case 6
                  ptv_str = 'Chyba!';
              case 7
                  ptv_str = 'Pozor!';
              case 8
                  ptv_str = 'Test Kvality Regul�ora';
              case 9
                  ptv_str = 'Identifik�ia z vlastn�h parmetrov';
              case 10
                  ptv_str = 'Krit�ia kvality';
              case 11
                  ptv_str = 'Na�ta� d�ov�s�or';
              case 12
                  ptv_str = 'Normaliz�ia';
              case 13
                  ptv_str = 'Spracovanie �ajov';
              case 14
                  ptv_str = 'Filtr�ia';
              case 15
                  ptv_str = 'Ulo�i� d�ov�s�or';
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
                  ptv_str = 'Pre mo�nos� "Vypn� a "Re�tart" bud�v�etky premenn�vymazan�z pam�i a okn�pozatv�ane!';
              case 2
                  ptv_str = ' Skuto�e chcete zada� nov�parametre prenosu riaden�o syst�u? Ak �o, v�etky ostatn�okn�sa zatvoria!';
              case 3
                  ptv_str = ' PIDTOOL u� bol spusten�';
              case 4
                  ptv_str = 'Parametre PID regul�ora:';
              case 5
                  ptv_str = 'Prenos regulovan�o syst�u:';
              case 6
                  ptv_str = '�iadan�veli�na w(t)';
              case 7
                  ptv_str = 'poruchov�veli�na r(t)';
              case 8
                  ptv_str = 'Parametre simul�ie:';
              case 9
                  ptv_str = 'Kon�tanty pre krit�ia kvality:';
              case 10
                  ptv_str = 'Chyba identifik�ie:';
              case 11
                  ptv_str = ' PCH';
              case 12
                  ptv_str = 'Zadajte ve�kos� a �s skokovej zmeny';
              case 13
                  ptv_str = ' Typ filtra';
              case 14
                  ptv_str = ' D�ov�s�or bol �pe�ne ulo�en�';
              case 15
                  ptv_str = ' Typ modelu:';
              case 16
                  ptv_str = ' Parametre modelu:';
              case 17
                  ptv_str = ' Po�adovan�ni���r� n_ni��ie:';
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
                  ptv_str = 'Sp�;
              case 3
                  ptv_str = 'Synt�a regul�ora';
              case 4
                  ptv_str = 'Identifik�ia';
              case 5
                  ptv_str = 'Nastavenia';
              case 6
                  ptv_str = 'Vypn�;
              case 7
                  ptv_str = 'Re�tart';
              case 8
                  ptv_str = 'Zavrie� grafy';
              case 9
                  ptv_str = 'Pomoc';
              case 10
                  ptv_str = 'Test Kvality';
              case 11
                  ptv_str = 'Z�ka� prenos';
              case 12
                  ptv_str = 'Identifik�ia z vlastn�h parametrov';
              case 13
                  ptv_str = 'Identifik�ia z d�ov�o s�oru';
              case 14
                  ptv_str = 'Identifik�ia z modelu';
              case 15
                  ptv_str = 'Syst� 1. r�u';
              case 16
                  ptv_str = 'Syst� n-t�o r�u';
              case 17
                  ptv_str = 'Porovnanie';
              case 18
                  ptv_str = 'Identifik�ia s ni��� r�om';
              case 19
                  ptv_str = 'Normaliz�ia';
              case 20
                  ptv_str = 'Filtr�ia';
              case 21
                  ptv_str = 'Ulo�i�';
              case 22
                  ptv_str = 'Porovna�';
              case 23
                  ptv_str = 'Zru�i�';
              case 24
                  ptv_str = 'Ladenie Identifik�ie';
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
                  ptv_str = ' Prenos aperiodick�o syst�u | Prenos tlmene kmitav�o syst�u';
              case 2
                  ptv_str = ' Aperiodick�| Tlmene kmitav�;
              case 3
                  ptv_str = 'FIR|IIR - Butterworthov|IIR - Ceby�ev|IIR - Ceby�ev inv.|IIR - eliptick�;
              case 4
                  ptv_str = 'dolnopriepustn�hornopriepustn�p�mov�z�er';
              case 5
                  ptv_str = 'jednoduch�dvojn�obn�;
              case 6
                  ptv_str = ' V�eobecn�tvar |Aperiodick�| Tlmene kmitav�;
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
                  ptv_str = ' Mrie�ka';
              case 3
                  ptv_str = ' Kmitav�proces';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % GUI RADIOBUTTON STRING
    %
    case 6
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Experiment�ne methody';
              case 2
                  ptv_str = ' Analytick�methody';
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
                  ptv_str = 'Synt�a regul�ora';  
              case 4
                  ptv_str = 'Identification';                  
              case 5
                  ptv_str = 'Filtr�ia';
              case 6
                  ptv_str = 'Kvalita regul�ie';                  
              case 7
                  ptv_str = 'Vypn�;
              case 8
                  ptv_str = 'Re�tart';
              case 9
                  ptv_str = 'Zavrie� grafy';
              case 10
                  ptv_str = 'Pomoc';
              case 11
                  ptv_str = 'Nastavenia';
              case 12
                  ptv_str = 'Zapn�efekty';
              case 13
                  ptv_str = 'Vypn�efekty';
              case 14
                  ptv_str = 'Zobraz v�ledky';
              case 15
                  ptv_str = 'D�um';
              case 16
                  ptv_str = '�s';
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
                  ptv_str = 'U_Doln�Hranica =';
              case 25
                  ptv_str = 'U_Horn�Hranica =';
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
                  ptv_str = 'r� filtra =';
              case 49
                  ptv_str = 'omega =';
              case 50
                  ptv_str = 'zvlnenie r =';
              case 51
                  ptv_str = 'Odch�ka filtr�ie =';
              case 52
                  ptv_str = 'n_Max =';
              case 53
                  ptv_str = 'Cas_Regul�ie';
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
                  ptv_str = ' Zadali ste nekorektn�parametre! Vstupom m� by� len re�ne �sla!';
              case 2
                  ptv_str = ' R� n m� by� len cel�kladn��slo!';
              case 3
                  ptv_str = ' Dopravn�oneskorenie D je nez�orn��slo!';
              case 4
                  ptv_str = ' Koeficient tlmenia ksi_pe m�by� kladn��slo men�ie alebo rovn�1!';
              case 5
                  ptv_str = ' S�or POMOC.HTML nen�den�';
              case 6
                  ptv_str = ' Parametre regul�ora musia by� re�ne �sla!';
              case 7
                  ptv_str = ' Cas_Sim nesmie by� z�orn��slo!';
              case 8
                  ptv_str = ' W_Cas_Zmeny mus�by� kladn��slo!';
              case 9
                  ptv_str = ' R_Cas_Zmeny mus�by� kladn��slo!';
              case 10
                  ptv_str = ' Kon�tanty pre krit�ia kvality nesm�by� z�orn��sla!';
              case 11
                  ptv_str = ' U_Doln�Hranica mus�by� men�ie ako U_Horn�Hranica!';
              case 12
                  ptv_str = ' Presnost_Riadenia mus�by� v��ia ako 0 a men�ia ako 1!';
              case 13
                  ptv_str = ' Zadali ste nekorektn�parametre! Vstupom m� by� len re�ny vektor!';
              case 14
                  ptv_str = ' Cas: t_0 < t_D < t_1 < t_2 < Cas_Sim! Alebo �s: t_0 < t_D <  t_Max < t_Min < Cas_Sim!';
              case 15
                  ptv_str = ' Ak je kladn�y_Inf, tak y_Min a y_0 musia by� men�ie ako y_Max opa�e pre z�orn�y_Inf!';
              case 16
                  ptv_str = 'Regulovan�proces nie je';
              case 17
                  ptv_str = ' r�zi,';
              case 18
                  ptv_str = ' stabiln�';
              case 19
                  ptv_str = ' na hranici stability,';
              case 20
                  ptv_str = ' riadite�n�';
              case 21
                  ptv_str = ' pozorovate�n�';
              case 22
                  ptv_str = ' Znamienko zosilnenia regul�ora Z_R je opa��ako zosilnenie procesu K!';
              case 23
                  ptv_str = ' Experiment�ne metody vy�aduj�aperiodick�model procesu!';
              case 24
                  ptv_str = ' Nie je mo�n�pou�i� identifik�iu tlmene kmitav�o syst�u! Sk�te identifik�iu pod�a Strejca!';
              case 25
                  ptv_str = ' Vybran�d�ov�s�or mus�ma� pr�onu *.txt or *.dat!';
              case 26
                  ptv_str = ' Vybran�d�ov�s�or neobsahuje korektn�d�a!';
              case 27
                  ptv_str = ' Zadan��s t_0 nie je v d�ovom s�ore!';
              case 28
                  ptv_str = ' Omega mus�by� vektor 1 alebo 2 prvokov s hodnotou od 0 do 1!';
              case 29
                  ptv_str = ' R� filtr�ie mus�by� kladn��slo!';
              case 30
                  ptv_str = ' Hornopriepustn�filter vy�aduje omega ako jedno re�ne �slo!';
              case 31
                  ptv_str = ' P�mov�z�er vy�aduje omega ako dvojprvkov�vektor!';
              case 32
                  ptv_str = ' Prvky vektora omega nem� by� zhodn�';
              case 33
                  ptv_str = ' Ceby�evov filter vy�aduje jednoprvkov�vektor zvlnenia r!';
              case 34
                  ptv_str = ' Dvojn�obn�filtr�ia vy�aduje d�ov�s�or 3-kr� va� ako r� filtr�ie!';
              case 35
                  ptv_str = ' D�ov�s�or nebol ulo�en�;
              case 36
                  ptv_str = ' Vektor MEN mus�ma� viac ako jeden prvok!';
              case 37
                  ptv_str = ' Nie je mo�n�identifikova� s r�om ni��� ako 1!';
              case 38
                  ptv_str = ' R� n_ni��ie mus�by� ni��ie ako n_Max!';
              case 39
                  ptv_str = ' Parameter T_I mus�by� kladn�re�ne �slo!';
              case 40
                  ptv_str = ' Parameter T_D mus�by� kladn�re�ne �slo!';
              case 41
                  ptv_str = ' Parameter T mus�by� kladn�re�ne �slo!';
              case 42
                  ptv_str = ' Parameter T_pe mus�bz� kladn�re�ne �slo!';
              case 43
                  ptv_str = ' Uzavret�regula��obvod je nestabiln�';
              case 44
                  ptv_str = ' Uzavret�regula��obvod je na hranici stability!';
              case 45
                  ptv_str = ' Parameter b_W mus�by� v��ia ako 0!';
              case 46
                  ptv_str = ' Touto metodou nie je mo�n�navrhn�regul�or pre zadan�parametre modelu procesu!';
              case 47
                  ptv_str = ' V pr�ade n�rhu PID alebo PD regul�ora dopravn�oneskorenie D mus�by� kladn��slo!';
              case 48
                  ptv_str = ' Po1�aduje sa r� n men��ako 9!';
              case 49
                  ptv_str = ' Ch�a funkcia EXPORTFIG!';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end


    % GUI PLOT STRING
    %
    case 10
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Sp�nov�bov�prechodov�charakteristika';
              case 2
                  ptv_str = ' Regula��vstup';
              case 3
                  ptv_str = ' cas t';
              case 4
                  ptv_str = ' V�tupn�velicina y(t)';
              case 5
                  ptv_str = ' Akcn�velicina u(t)';
              case 6
                  ptv_str = ' OV y(t) bez obmedzen�na MV u(t)';
              case 7
                  ptv_str = ' OV y(t) po obmedzen�MV u(t)';
              case 8
                  ptv_str = ' Horn�hranica OV y(t)';
              case 9
                  ptv_str = ' Doln�hranica OV y(t)';
              case 10
                  ptv_str = ' �iadan�velicina w(t)';
              case 11
                  ptv_str = ' MV u(t) bez obmedzen�;
              case 12
                  ptv_str = ' MV u(t) pred obmedzen�';
              case 13
                  ptv_str = ' MV u(t) po obmedzen�;
              case 14
                  ptv_str = 'V�ledok identifik�ie';
              case 15
                  ptv_str = 'Udaje nac�an�z d�ov�o s�oru';
              case 16
                  ptv_str = 'Prechodov�charakteristika';
              case 17
                  ptv_str = 'P�odn�v�tup';
              case 18
                  ptv_str = 'V�tup z filtr�ie';
              case 19
                  ptv_str = 'Porovnanie prechodov�h charakterist�';
              case 20
                  ptv_str = 'Porovn�an�v�tup';
              case 21
                  ptv_str = 'Model s ni��� r�om';
              case 22
                  ptv_str = 'Normalizovan�v�tup';
              case 23
                  ptv_str = 'Nomin�ny v�tup';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

    % PTC - CONTROLER TUNING TEXT
    %
    case 11
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda|Cohenova - Coonova metoda|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Minimum ITAE metoda (�oha regul�ie)|Lopezova IAE-ISE metoda';
              case 2
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda|Cohenova - Coonova metoda|Metoda priamej synt�y regul�ora|Haalmanova metoda|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Metoda polovi��o �lmu|Riverova - Morariho metoda|Riverova - Morariho metoda (zlep�en�|Minimum IAE metoda|Minimum ITAE metoda|Lopezova IAE-ISE metoda|Astromova - Hagglundova metoda (Ms = 1.4)|Astromova - Hagglundova metoda (Ms = 2.0)';
              case 3
                  ptv_str = 'Zieglerova - Nicholsova metoda|Strejcova metoda |Cohenova - Coonova metoda|Metoda priamej synt�y regul�ora|Chienova - Hronesova - Reswickova metoda (0% prereg.)|Chienova - Hronesova - Reswickova metoda (20% prereg.)|Metoda polovi��o �lmu|Riverova - Morariho metoda|Minimum IAE metoda|Minimum ITAE metoda|Lopezova IAE-ISE metoda|Astromova - Hagglundova metoda (Ms = 1.4)|Astromova - Hagglundova metoda (Ms = 2.0)';
              case 4
                  ptv_str = 'Cohenova - Coonova metoda';
              case 5
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda';
              case 6
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda|Metoda zalozen�na bezpe�osti v zosilnen�a vo f�e|Metoda po�adovan�o modelu|Metoda n�obn�o dominantn�o polu|Metoda optim�neho modulu';
              case 7
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda|Metoda zalozen�na bezpe�osti v zosilnen�a vo f�e|Metoda po�adovan�o modelu|Metoda n�obn�o dominantn�o polu|Metoda optim�neho modulu';
              case 8
                  ptv_str = 'Metoda umiestnenia polov|Naslinova metoda';
              case 9
                  ptv_str = ' R� n mus�by� v���ako 1!';
              case 10
                  ptv_str = ' R� n mus�by� v���ako 2!';
              case 11
                  ptv_str = ' Casov�kon�tanta uzavret�o reg. obvodu T_URO < Tn';
              case 12
                  ptv_str = 'T_URO = ';
              case 13
                  ptv_str = ' Riadenie na �iadan�hodnotu';
              case 14
                  ptv_str = ' Odstra�vanie vplyvu poruchy';
              case 15
                  ptv_str = ' Casov�kon�tanta URO T_URO>0.2*Tn a T_URO>1.7*Tu';
              case 16
                  ptv_str = ' Maxim�ne preregulovanie:';
              case 17
                  ptv_str = ' 0%| 5%| 10%| 15%| 20%| 25%| 30%| 35%| 40%| 45%| 50%';
              case 18
                  ptv_str = ' Casov�kon�tanta uzavret�o reg. obvodu T_URO>0.2Tn a (T_URO/Tu)>0.25';
              case 19
                  ptv_str = ' 1 %| 3 %| 5 %| 8 %| 12 %| 16 %| 20 %';
              case 20
                  ptv_str = ' Parametre referen��o prenosu:';
              case 21
                  ptv_str = ' Referen��polynom:';
              case 22
                  ptv_str = ' Vlastn� Binomick� Butterworthov| Minimum t(5%)| Minimum krit�ia ITAE';
              case 23
                  ptv_str = 'ksi_0 =';
              case 24
                  ptv_str = 'w_0 =';
              case 25
                  ptv_str = ' Zadan�pol w_0 je nestabiln�';
              case 26
                  ptv_str = 'S_0 = ';
              case 27
                  ptv_str = 'Dopo�tal sa nestabiln�pol!';
              case 28
                  ptv_str = 'Dopo�tal sa stabiln�pol!';
              case 29
                  ptv_str = ' R� n mus�by� 2 alebo 3!';
              case 30
                  ptv_str = ' Po�aduje sa aperiodick�model druh�o r�u!';
              case 31
                  ptv_str = ' Metoda po�aduje dopravn�oneskorenie D ako kladn��slo!';
              case 32
                  ptv_str = ' R� n mus�by� 1!';
              case 33
                  ptv_str = 'Zadajte bezpe�os� v zosilnen�Gm a vo f�e Pm:';
              case 34
                  ptv_str = 'Gm [dB]';
              case 35
                  ptv_str = 'Pm [deg]';
              case 36
                  ptv_str = ' Bezpe�os� v zosilnen�Gm mus�by� v��ia ako 1!';
              case 37
                  ptv_str = ' Pre dan�model procesu nie je mo�n�navrhn�regul�or pomocou vybranej metody!';
              case 38
                  ptv_str = ' R� n mus�by� 3!';
              case 39
                  ptv_str = ' Po�aduje sa aperiodick�model!';
              case 40
                  ptv_str = ' Pri synt�e PID regul�ora sa o�k�a model procesu 2. r�u!';
              case 41
                  ptv_str = ' Koeficient tlmenia ksi_pe m�by� v���ako 0.71!';
              case 42
                  ptv_str = ' Koeficient tlmenia ksi_pe m�by� v���ako 0.5!';
              case 43
                  ptv_str = ' R� n mus�by� men��ako 3!';
              case 44
                  ptv_str = ' T�o metoda po�aduje Tu > 0!';
              otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
           end

% ------------------- %

    otherwise
                  ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num);
  end