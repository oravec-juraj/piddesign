% PTE_STC
%
%   St. CLAIR (1997)
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


function [zr,ti,td] = pte_stc(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 1/3*T/(K*D);
    ti = T;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end