% PTE_MCM
%
%   McMILLAN (1994)
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


function [zr,ti,td] = pte_MCM(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = K/3;
    ti = D;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end