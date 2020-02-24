% PTF_LINE
%
%   Function PTF_LINE returns the line descriptopn reached from two points
%
%   ptv_line = ptf_line(x,y)
%
%   where
%   x - is vector of two points positions on X axis
%   y - is vector of two points positions on Y axis

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk
% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------


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
