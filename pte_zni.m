% PTE_ZNI
%
%   ZIEGLER-NICHOLS IMPROVED (CHIDAMBARAM) (2002)
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


function [zr,ti,td] = pte_zni(typ_m,typ_c,K,T,D)

if(typ_m == 2)

% PI Controller
%
if(typ_c == 2)

    zr = 1/K*(0.4+0.665*T/D);
    ti = 3.4*D;
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