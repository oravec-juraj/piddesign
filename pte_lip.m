% PTE_LIP
%
%   LIPTAK (2001)
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


function [zr,ti,td] = pte_lip(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 0.95*T/(K*D);
    ti = 4*T;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end