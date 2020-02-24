% PTE_TSR
%
%   Experimental method for controller tuning by T-sum rule by Kuhn
%
%   [zr,ti,td] = pte_tsr(typ_m,typ_c,n,K,T)
%
%   where
%
%   typ_m - is variable for choice of the controled model type
%       typ_m == 2:
%
%                K
%      G(s) = -------*exp(-Ds)
%               T*s+1
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   n - is order of proces model 
%   K - is gain of proces model
%   T - is time constant of proces model
%
%   2011.06.20.
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

function [zr,ti,td] = pte_tsm(typ_m,typ_c,n,K,T)

if(typ_m == 2)

% Additional controller tuning parameter T_SUM
%
t_sum = n*T;

% PI Controller
%
if(typ_c == 2)

    zr = 0.5/K;
    ti = 0.5*t_sum;
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1/K;
    ti = 0.66*t_sum;
    td = 0.167*t_sum;

end

% --- %

else
    
    zr = Inf;
    ti = Inf;
    td = Inf;

end