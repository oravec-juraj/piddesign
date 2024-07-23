% P_V_PARAM
%
%   Sluzi na vypocet parametrov P regulatora pomocou vybranej analytickej
%   metody



  % Pomocna premenna, aby analyticka metoda vedela, aky typ regulatora
  % sa ma vygenerovat:
  % J3 = 1 pre P reg
  % J3 = 2 pre PI reg
  % J3 = 3 pre PID reg
J3=1;
  
% METODY
%
%------------ Metoda umiestnenia polov ------

if typy_ns == 1
    
    if(n>2)
       pth_fig = ptg_error('reg_v',ptg_string(11,43,ptv_str_lang),ptv_str_lang);
   else
       typy_n=1;
       param_mup
end

% ---------- Naslinova metoda -----------------
elseif typy_ns == 2

  close
  
% Kontrola vhodneho radu:
%
if (n<2)
       pth_fig = ptg_error('reg_v',ptg_string(11,9,ptv_str_lang),ptv_str_lang);
  else
    nm
end

% --------------------------------
%     Metoda nasobneho dominantneho polu
%
elseif typy_ns == 3
    
    % Testovanie aperiodickosti modelu
    %
    if(typ_i==2)
        
        pth_fig = ptg_error('reg_v',ptg_string(11,39,ptv_str_lang),ptv_str_lang);

    else

        [z_r,t_i,t_d] = pta_mdp(3,1,n,K,T);

        close
        simul_param
        
    end

% -------------- %

end
  

              