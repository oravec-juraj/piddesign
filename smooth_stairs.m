
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

function u_smooth = smooth_stairs(u)

% Temporary variables
%
u_max = length(u);

% Initial values of outputs
%
u_smooth = zeros(u_max,1);
u_smooth(1) = u(1);
u_smooth(end) = u(end);

for k = (u_max - 1) : -1 : 2
    
    if (u(k) ~= u(k+1)) & (u(k) ~= u(k-1))
        u_smooth(k) = u_smooth(k+1);
    else
        u_smooth(k) = u(k);
        
    end
    
end
