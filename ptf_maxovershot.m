% PTF_MAXOVERSHOT
%
%   Function PTF_MAXOVERSHOT returns maximal overshot
%
%   sigma_Max = ptf_maxovershot(y)



function sigma_Max = ptf_maxovershot(y)

    if(y(end) < y(1))
        y_Max = min(y);
    else
        y_Max = max(y);
    end

    y_Max = y_Max(1);

    sigma_Max = (y_Max - y(end))/(y(end)-y(1));
    sigma_Max = sigma_Max*100;