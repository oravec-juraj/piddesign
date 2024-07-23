% PTE_SHI
%
%   SHINKEY (2000,2001)
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


function [zr,ti,td] = pte_shi(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 2/3*T/(K*D);
    ti = 3.78*T;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end