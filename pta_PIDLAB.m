% Process model
%


K = 1;
T = 1;

% Required point X [g; j*h]
%
g = -1;
h = 1;

% Omega vector ( s = j*w )
%
w = (0:0.1:3);

% Controller tuning
%
for k = 1:length(w)
    a = K/(1+T^2*w(k)^2);
    b = -(K*T*w(k))/(1+T^2*w(k)^2);
    zr(k) = (a*g + b*h)/(a^2 + b^2);
    ki(k) = ((a*g - b*h)*w(k))/(a^2 + b^2);
end

ti = zr./ki;
[zr, ki, ti]
plot(zr,ki)
grid
