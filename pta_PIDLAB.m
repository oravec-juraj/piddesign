% Process model
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
