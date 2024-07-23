% PTE_SUY
%
%   SUYAMA (1994)
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


function [zr,ti,td] = pte_suy(typ_m,typ_c,K,T,D)

if(typ_m == 2)

% PI Controller
%
if(typ_c == 2)

    zr = 0.5*T/(K*D);
    ti = T;
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