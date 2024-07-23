% PTF_SETIME
%
%   Function PTF_SETIME returns settle time
%
%   set_time = ptf_setime(t, y, wd, wh)



function set_time = ptf_setime(t, y, wd, wu)

    temp = find(y >= wu);

    if(isempty(temp))
        set_time1 = 0;
    else
        set_time1 = t(temp(end));
    end

    temp = find(y <= wd);

    if(isempty(temp))
        set_time2 = 0;
    else
        set_time2 = t(temp(end));
    end

    set_time = max(set_time1,set_time2);
    
    if(y(end)>wu||y(end)<wd)
        set_time = Inf;
    end