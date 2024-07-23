% PTE_KLE
%
%   KLEIN ET AL. (1992)
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


function [zr,ti,td] = pte_kle(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 0.28*T/(K*(D+0.1*T));
    ti = 0.53*D;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end