% PTE_STREJC
%
%   Experimental method for controller tuning by Strjec method
%
%   [zr,ti,td] = pte_strejc(typ_c,n,K,T)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 1 for P Controller
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   n - is order of proces model
%   K - is gain of proces model
%   T - is time constant of proces model

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



function [zr,ti,td] = pte_strejc(typ_c,n,K,T)

ti = 1e10;
td = 0;

% P
%
if(typ_c==1)

    zr = (1/K)*(1/(n-1));

% PI
%
elseif(typ_c==2)

    zr = (1/K)*((n+2)/(4*(n-1)));
    ti = T*((n+2)/3);

% PID
%
else(typ_c==3)

    zr = (1/K)*(((7*n)+16)/(16*(n-2)));
    ti = T*(((7*n)+16)/15);
    td = T*(((n+1)*(n+3))/((7*n)+16));

end