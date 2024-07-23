% PTE_BGR
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


function [zr,ti,td] = pte_bgr(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 1.0*T/(K*D);
    ti = 3*D;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end