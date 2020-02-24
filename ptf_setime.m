% PTF_SETIME
%
%   Function PTF_SETIME returns settle time
%
%   set_time = ptf_setime(t, y, wd, wh)

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