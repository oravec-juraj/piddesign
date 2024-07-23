% PD_V_PARAM
%
%   Sluzi na vypocet parametrov PD regulatora pomocou vybranej analytickej
%   metody



  % Pomocna premenna, aby analytick?metoda vedela, aky typ regulatora
  % sa ma vygenerovat:
  % J3 = 1 pre P reg
  % J3 = 2 pre PI reg
  % J3 = 3 pre PID reg
  % J3 = 4 pre PD reg
  J3=4;

% METODY
%
%------------ Metoda umiestnenia polov ------
          
if typy_ns == 1

    if(n<2||n>3)
        pth_fig = ptg_error('reg_v',ptg_string(11,29,ptv_str_lang),ptv_str_lang);
    else
        typy_n=1;
        close
        param_mup
end

% ---------- Naslinova metoda -----------------

elseif typy_ns == 2

    % Kontrola vhodneho radu:
    %
    if(n<3)
        pth_fig = ptg_error('reg_v',ptg_string(11,10,ptv_str_lang),ptv_str_lang);
    else
        close
        nm
    end


% ---------- Metoda nasobneho dominantneho polu ---
%
elseif typy_ns == 3

    % Testovanie aperiodickosti modelu
    %
    if(typ_i==2)
        
        pth_fig = ptg_error('reg_v',ptg_string(11,39,ptv_str_lang),ptv_str_lang);

    % Testovanie vhodnosti radu, aby sa predislo deleniu nulou
    %
    elseif (n<2)
        
        pth_fig = ptg_error('',ptg_string(11,9,ptv_str_lang),ptv_str_lang);
        
    else
        
        [z_r,t_i,t_d] = pta_mdp(3,4,n,K,T);

        close
        simul_param
    end

% --------------------------------------------------------------- %
end
       