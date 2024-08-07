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