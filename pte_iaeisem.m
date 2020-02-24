% PTE_IAEISEM
%
%   Experimental method for controller tuning by Lopez IAE-ISE method
%
%   [zr,ti,td] = pte_iaeisem(typ_c,K,Tu,Tn)
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


function [zr,ti,td] = pte_iaeisem(typ_c,K,Tu,Tn)

% P Controller
%
if(typ_c == 1)

    zr = 1.411*Tu/(K*Tn^(-0.917));
    ti = 1e10;
    td = 0;

% PI Controller
%
elseif(typ_c == 2)

    zr = 1.305*Tu/(K*Tn^(-0.959));
    ti = Tn/0.496*((Tu/Tn)^0.739);
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1.495*Tu/(K*Tn^(-0.949));
    ti = Tn/1.101*((Tu/Tn)^0.771);
    td = 0.56*Tu*((Tn/Tu)^1.006);

end
