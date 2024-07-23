% Tunning method list


function ptv_pop_tmlist = ptf_pop_tmlist(ptv_typpid,ptv_typtm,ptv_str_lang)


    % --- Experimenthal methods ---
    %
    % Exp. P reg
    if(ptv_typpid == 1 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,1,ptv_str_lang);
    end
    %
    % Exp. PI reg
    if(ptv_typpid == 2 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,2,ptv_str_lang);
    end
    %
    % Exp. PID reg
    if(ptv_typpid == 3 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,3,ptv_str_lang);
    end
    %
    % Exp. PD reg
    if(ptv_typpid == 4 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,4,ptv_str_lang);
    end
    %
    % --- Analythical methods ---
    %
    % Ana. P reg
    if(ptv_typpid == 1 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,5,ptv_str_lang);
    end
    %
    % Ana. PI reg
    if(ptv_typpid == 2 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,6,ptv_str_lang);
    end
    %
    % Ana. PID reg
    if(ptv_typpid == 3 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,7,ptv_str_lang);
    end
    %
    % Ana. PD reg
    if(ptv_typpid == 4 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,8,ptv_str_lang);
    end