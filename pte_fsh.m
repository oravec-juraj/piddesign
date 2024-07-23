% PTE_FSH
%
%   FERTIK AND SHARPE (1979)
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


function [zr,ti,td] = pte_fsh(typ_m,typ_c,K,T,D)

if(typ_m == 2)

% PI Controller
%
if(typ_c == 2)

    zr = 0.56/K;
    ti = 0.65*D;
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end

% ---------- %
%
% No required model form found
%
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end