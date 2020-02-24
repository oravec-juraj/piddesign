% PTE_IAEM
%
%   Experimental method for controller tuning by Minimum IAE method
%
%   [zr,ti,td] = pte_iaem(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc

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


function [zr,ti,td] = pte_iaem(typ_c,K,Tu,Tn)

% PI Controller
%
if(typ_c == 2)

    zr = 0.758/K*(Tu/Tn)^(-0.861);
    ti = Tn^2/(1.020*Tn + (-0.323)*Tu);
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1.086/K*(Tu/Tn)^(-0.869);
    ti = Tn^2/(0.740*Tn + (-1.130)*Tu);
    td = Tn*0.348*(Tu/Tn)^0.914;

end
