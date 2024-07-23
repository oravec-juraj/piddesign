% PTF_LINE
%
%   Function PTF_LINE returns the line descriptopn reached from two points
%
%   ptv_line = ptf_line(x,y)
%
%   where
%   x - is vector of two points positions on X axis
%   y - is vector of two points positions on Y axis



function ptv_line = ptf_line(x,y)

    a = (y(2)-y(1)) / (x(2)-x(1));
    b = y(2) - a*x(2);

    a = num2str(a);
    
    if(b >= 0)
        b = num2str(b);
        b = ['+ ',b];
    else
        b = num2str(abs(b));
        b = ['- ',b];
    end

    ptv_line = ['y = ',a,'*t ',b];
