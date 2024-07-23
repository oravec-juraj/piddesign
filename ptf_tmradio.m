% Tunning method


function ptv_typtm = ptf_tmradio(pth_rad,typ_i,ptv_str_lang)

    ptv_typtm = get(pth_rad,'Tag');
    
    ptv_typtm = ptv_typtm(end);

    set(pth_rad,'Value',1);
    
    % Deactive unchcked radiobuttons
    if(ptv_typtm~='1')
        set(findobj('Tag','ptt_radio_tm1'),'Value',0);
    end

    if(ptv_typtm~='2')
        set(findobj('Tag','ptt_radio_tm2'),'Value',0);

        if(typ_i==2)
            ptv_typtm = '2';
            close
            pth_fig = ptg_error('reg_v',ptg_string(9,23,ptv_str_lang),ptv_str_lang);
        end

    end

    ptv_typtm = str2num(ptv_typtm);