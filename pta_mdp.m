% PTA_MDP
%
%   Analytical method for controller tuning by Multiple dominant pole method
%
%   [zr,ti,td] = pta_mdp(typ_m,typ_c,n,K,T)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   n - is order of the proces model
%   K - is gain of proces model
%   T - is time constant of proces model
%
%   typ_m == 2:
%
%             K
%   G(s) = -------*exp(-Ds)
%           T*s+1
%
%
%   typ_m == 3:
%
%               K
%   G(s) = -------------
%          s*(T*s+1)^(n)
%
%   2011.03.17.
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

function [zr,ti,td] = pta_omm(typ_m,typ_c,n,K,T)

if(typ_m == 2)

% PI Controller
%
if(typ_c == 2)

    zr = (1/K)*(((n-1)/(n+1))^(n-1));
    ti = T*(((n+1)^2)/(4*n));
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

     zr=((5*n-4)/(K*(n+1)))*(((n-2)/(n+1))^(n-2));
     ti=(5*T*(5*n-4)*(n+1)^2)/(27*n*(n-1));
     td=T*(n+1)*n/(2*(5*n-4));

else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end

elseif(typ_m == 3)

% P Controller
%
if(typ_c == 1)

    zr = 1/(K*T*(n+1)) * ((n)/(n+1))^(n);
    ti = 1e10;
    td = 0;

% PD Controller
%
elseif(typ_c == 4)
    
    zr = (4*n)/(K*T*(n+1)^2)*((n-1)/(n+1))^(n-1);
    ti = 1e10;
    td = (T*(n+1)^2)/(4*n);
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end
% ---------- %
%
% No required model form found
%
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end

