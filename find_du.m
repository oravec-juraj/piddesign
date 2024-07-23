

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
