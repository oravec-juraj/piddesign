

function ptv_typpid = ptf_pidradio(pth_rad)

    % Check which radiobutton has been choosen
    %
    ptv_typpid = get(pth_rad,'Tag');
    %    
    ptv_typpid = ptv_typpid(end);
    %
    set(pth_rad,'Value',1);
    
    % Deactive unchcked radiobuttons
    if(ptv_typpid~='1')
        set(findobj('Tag','ptt_radio_pid1'),'Value',0);
    end
    
    if(ptv_typpid~='2')
        set(findobj('Tag','ptt_radio_pid2'),'Value',0);
    end
    
    if(ptv_typpid~='3')
        set(findobj('Tag','ptt_radio_pid3'),'Value',0);
    end
    
    if(ptv_typpid~='4')
        set(findobj('Tag','ptt_radio_pid4'),'Value',0);
    end

    ptv_typpid = str2num(ptv_typpid);

% Text effect
ptf_choosenpid(ptv_typpid);