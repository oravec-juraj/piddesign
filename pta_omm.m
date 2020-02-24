% PTA_OMM
%
%   Analytical method for controller tuning by Optimal module method
%   method
%
%   [zr,ti,td] = pta_omm(typ_c,K,DEN)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of proces model
%   DEN - is denominator of proces model

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


function [zr,ti,td] = pta_omm(typ_c,K,DEN)

DEN = [zeros(1,4-length(DEN)),DEN];

a0 = DEN(4);
a1 = DEN(3);
a2 = DEN(2);
a3 = DEN(1);

A = [-2*K*a0 2*K*a1; 2*K*a2 -2*K*a3];
B = [a0^2; a1^2-2*a2*a0];

if(typ_c == 3)

    A = [A,[0; -2*K*a1]];
    A = [A;[0, 0, 2*K*a3]];

    B = [B; -2*a1*a3+a2^2];

end

if(det(A)==0)       % Error! Impossible to use this method for this process model
    zr = -Inf;
    ti = -Inf;
    td = -Inf;

else

    r = inv(A)*B;

    zr = r(1);
    ti = r(1)/r(2);

    if(typ_c == 3)
        td = r(3)/r(1);
    else
        td = 0;
    end

end