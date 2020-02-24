% PTF_CL
%
%   Function PTF_CL check the stability of closed-loop system.
%
%   [stab,closed_loop_denominator,closed_loop_numerator] = ptf_cl(B,A,Q,P,D)
%
%   where
%
%   Process model: Gs = B/A
%   Controller: Gr = Q/P 
%
%   D - is transport delay of process model
%   If transport delay D is set, it is aproximated using Taylor expansion:
%   exp(-D*s) = (-D*s + 2)/(D*s + 2)
%   and process model Gs = B/A is modified
% 
%   Characteristic polynom of closed-loop counting:
%   1 + Gs * Gr = 0
%   1 + (B*Q)/(A*P) = 0
%
%   1 + (B*Q)/(A*P) = 0
%   (A*P) + (B*Q) = 0
%   closed_loop_denumerator = 0
%
%   closed_loop_denumerator = (A*P) + (B*Q)
%
%   Function returns:
%
%   stab == 1 for stable closed-loop,
%   stab == 0 for untable closed-loop
%   stab == -1 for closed-loop on the boundary of stability
%
%   closed_loop_denumerator - is a vector of a characteristic polynom of
%   closed-loop

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


function [stability,closed_loop_denominator,closed_loop_numerator] = ptf_cl(B,A,Q,P,D)

%   Characteristic polynom of closed-loop counting:
%
%   1 + (B*Q)/(A*P) = 0
%   (A*P) + (B*Q) = 0
%   X1 = (A*P)
%   X2 = (B*Q)
%   1 + X2 / X1 = 0
%   X1 + X2 = 0
%   closed_loop_denominator = X1 + X2
%   closed_loop_numerator = X2

if((nargin == 5)&&(D > 0))

    % Transport delay aproximation using Taylor expansion
    %
    A = conv(A,[D, 2]);
    B = conv(B,[-D, 2]);

end

X1 = conv(A, P);
X2 = conv(B,Q);

if(length(X1) > length(X2))
    X2 = [zeros(1,length(X1)-length(X2)),X2];
else
    X1 = [zeros(1,length(X2)-length(X1)),X1];
end

closed_loop_denominator = X1 + X2;
closed_loop_numerator = X2;

if((roots(closed_loop_denominator)<0) == 1)
    
    % Stable closed-loop
    %
    stability = 1;

elseif(sum(roots(closed_loop_denominator)) == 0)
    % Stable closed-loop on the boundary of stability 
    %
    stability = -1;

else
    % Unstable closed-loop
    %
    stability = 0;

end