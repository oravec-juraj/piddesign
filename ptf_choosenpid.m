

function ptf_choosenpid(ptv_typpid)
    % Text effect
    choosenpid ='';
    if(ptv_typpid == 2)
        choosenpid = 'I';
    end
    if(ptv_typpid == 3)
        choosenpid = 'ID';
    end
    if(ptv_typpid == 4)
        choosenpid = 'D';
    end
    set(findobj('Tag','ptt_choosenpid'),'String',['P',choosenpid])
    set(gcf,'Name',['P',choosenpid])