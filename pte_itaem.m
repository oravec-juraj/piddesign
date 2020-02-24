% PTE_ITAEM
%
%   Experimental method for controller tuning by Minimum ITAE method 
%   (Smith - Murrill method)
%
%   [zr,ti,td] = pte_itaem(typ_c,K,Tu,Tn,performance)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 1 for P Controller
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc
%
%   performance - is variable for choiceof the controller tuning style
%       performance == 1 for Setpoint tracking
%       performance == 2 for Disturbance rejection

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


function [zr,ti,td] = pte_itaem(typ_c,K,Tu,Tn,performance)

if(performance == 1)

    % PI Controller
    %
    if(typ_c == 2)

        zr = 0.586/K*(Tn/Tu)^(0.916);
        ti = Tn/(1.03 -0.165*(Tu/Tn));
        td = 0;

    % PID Controller
    %
    elseif(typ_c == 3)

        zr = 0.965/K*(Tn/Tu)^(0.865);
        ti = Tn/(0.796 -0.147*(Tu/Tn));
        td = 0.308*Tn*(Tu/Tn)^0.929;

    end

elseif(performance == 2)

    % P Controller
    %
    if(typ_c == 1)

        zr = 0.49/K*(Tn/Tu)^(1.084);
        ti = 1e10;
        td = 0;
    % PI Controller
    %
    elseif(typ_c == 2)

        zr = 0.859/K*(Tn/Tu)^(0.977);
        ti = Tn/0.674*(Tu/Tn)^(0.680);
        td = 0;

    % PID Controller
    %
    elseif(typ_c == 3)

        zr = 1.357/K*(Tn/Tu)^(0.947);
        ti = Tn/0.842*(Tu/Tn)^(0.738);
        td = 0.381*Tn*(Tu/Tn)^0.995;

    end

end