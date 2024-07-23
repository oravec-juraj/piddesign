% PTE_HVW
%
%   HAZEBROKEN AND VAN DER WAERDEN (1951)
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


function [zr,ti,td] = pte_hvw(typ_m,typ_c,K,T,D)

% PI Controller
%
if(typ_c == 2)

    zr = 1/K*(0.77*T/D-1);
    
    if(D >= T)
        
        ti = 1.66*D;
        
    else
        
        ti = 3.32*D;
        
    end
    
    td = 0;
    
else
    
    zr = Inf;
    ti = Inf;
    td = Inf;
    
end