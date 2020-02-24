% PTE_WJCHM
%
%   Experimental method for controller tuning by Wang-Juang-Chang method 
%
%   [zr,ti,td] = pte_wjchm(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc
%

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


function [zr,ti,td] = pte_wjchm(typ_c,K,Tu,Tn)

% PID Controller
%
if(typ_c == 3)
    
    zr = ( (0.7307+0.5307*(Tn/Tu))*(Tn+0.5*Tu) )/ ( K*(Tn+Tu) );
    ti = Tn+0.5*Tu;
    td = 0.5*Tn*Tu/ (Tn+0.5*Tu);

end
