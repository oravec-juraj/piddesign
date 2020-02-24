
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

function type = ptf_get_modelparam(input1,input2)

% Chk input
%
if (nargin == 1)
    type_input = class(input1);
    if(type_input(1)~='t')
        
        error('PTF_GET_MODELPARAM:1: Incorrect input')
    
    else
        
        [num,den] = tfdata(input1,'v');

    end
    
else
    
    num = input1;
    den = input2;
    
end

% Chk gain
%
for n = 2 : size(num(2)-1)
    
    if(num(n) ~= 0)
        error('PTF_GET_MODELPARAM:2: Incorrect input')
    end

end

% Model clasification
%

% 1 - First order model
%
if(size(den,2) == 2)
   
    type = 1;

% 2 - Strejc model
%
elseif(size(den,2) >= 3) & (imag(roots(den)) == 0) & (sum( find(den==0) ) == 0)
    
    type = 2;

% 3 - Damped periodic model
%
elseif(size(den,2) == 3) & (imag(roots(den)) ~= 0)
    
    type = 3;
    
% 4 - Astatic model + strejc model
%
elseif(size(den,2) >= 3) & (imag(roots(den)) == 0) & (sum( find(den==0) ) ~= 0)
    
    type = 4;

else
    
    type = -Inf;
    
end


num
den

% Strejc model
%
T = nthroot(den(1),size(den,2)-1);

    

    
