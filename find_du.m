
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

function [ind_du, delta_u, length_u] = find_du(u)

% Initail value of output
%
ind_du(1) = 1;

% Temporary variables
%
n = 1;
ind_du_temp = 1;
u_bound(1) = u(1);

while (isempty(ind_du_temp) == 0)

    n = n + 1;
    u_before = u_bound(n-1);
    u_temp = u(ind_du(n-1):end);
    ind_du_temp = find( u_bound(n-1) ~= u_temp );
    
    if( isempty(ind_du_temp) ~=1 )
        
        ind_du(n) = ind_du_temp(1) + ind_du(n-1) - 1;
        u_bound(n) = u(ind_du(n));
        
    end
    
end

ind_du = [ind_du(2:end),length(u)];

for n = length(ind_du) : -1 : 2
    
    length_u(n-1) = ind_du(n) - ind_du(n-1);
    
end

for n = 1 : length(u_bound)-1
    
    delta_u(n) = u_bound(n+1) - u_bound(n);
    
end
