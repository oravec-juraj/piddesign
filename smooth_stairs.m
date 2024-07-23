

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
