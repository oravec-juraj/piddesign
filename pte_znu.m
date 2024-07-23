% PTE_ZNU
%
%   ZIEGLER-NICHOLS ULTIMATE CYCLE METHOD (FAANES AND SKOGESTAD) (2004)
%
%
%   typ_m == 2:
%
%             K
%   G(s) = -------*exp(-Ds)
%           T*s+1
%
%   2011.03.17.
%


function [zr,ti,td] = pte_znu(typ_m,typ_c,K,T,D)

if(typ_m == 2)

% PI Controller
%
if(typ_c == 2)

    zr = 0.71*T/(K*D);
    ti = 3.3*D;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end

% --- %

else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end