% PTE_AHM
%
%   Experimental method for controller tuning by Astrom - Hagglund method
%
%   [zr,ti,td,b] = pte_ahm(typ_c,K,Tu,Tn,Ms)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc
%   Ms - parameter of required robustness
%       Ms - 1.4 less robust controller
%       Ms - 2.0 more robust controller

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


function [zr,ti,td,b] = pte_ahm(typ_c,K,Tu,Tn,Ms)

if(Ms == 1.4)

    % PI Controller
    %
    if(typ_c == 2)

        zr = 0.29*Tn/(K*Tu)*exp(-2.7*(Tu/(Tu+Tn)) + 3.7*(Tu/(Tu+Tn))^2 );
        ti = 8.9*Tu*exp(-6.6*(Tu/(Tu+Tn)) + 3*(Tu/(Tu+Tn))^2 );
        td = 0;
        b =  0.81*exp(0.73*(Tu/(Tu+Tn)) + 1.9*(Tu/(Tu+Tn))^2 );

    % PID Controller
    %
    elseif(typ_c == 3)

        zr = 3.8*Tn/(K*Tu)*exp(-8.4*(Tu/(Tu+Tn)) + 7.3*(Tu/(Tu+Tn))^2 );
        ti = 5.2*Tu*exp(-2.5*(Tu/(Tu+Tn)) - 1.4*(Tu/(Tu+Tn))^2 );
        td = 0.89*Tu*exp(-0.37*(Tu/(Tu+Tn)) - 4.1*(Tu/(Tu+Tn))^2 );
        b =  0.4*exp(0.18*(Tu/(Tu+Tn)) + 2.8*(Tu/(Tu+Tn))^2 );

    end

elseif(Ms == 2)

    % PI Controller
    %
    if(typ_c == 2)

        zr = 0.78*Tn/(K*Tu)*exp(-4.1*(Tu/(Tu+Tn)) + 5.7*(Tu/(Tu+Tn))^2 );
        ti = 8.9*Tu*exp(-6.6*(Tu/(Tu+Tn)) + 3*(Tu/(Tu+Tn))^2 );
        td = 0;
        b =  0.44*exp(0.78*(Tu/(Tu+Tn)) - 0.45*(Tu/(Tu+Tn))^2 );

    % PID Controller
    %
    elseif(typ_c == 3)

        zr = 8.4*Tn/(K*Tu)*exp(-9.6*(Tu/(Tu+Tn)) + 9.8*(Tu/(Tu+Tn))^2 );
        ti = 3.2*Tu*exp(-1.5*(Tu/(Tu+Tn)) - 0.93*(Tu/(Tu+Tn))^2 );
        td = 0.86*Tu*exp(-1.9*(Tu/(Tu+Tn)) - 0.44*(Tu/(Tu+Tn))^2 );
        b =  0.22*exp(0.65*(Tu/(Tu+Tn)) - 0.051*(Tu/(Tu+Tn))^2 );

    end
    
end