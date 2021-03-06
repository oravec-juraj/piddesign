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

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk
% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------

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