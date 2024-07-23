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