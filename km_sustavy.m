% KM_SUSTAVY
%
%   Funkcia KM_SUSTAVY sluzi na identifikaciu tlmene kmitaveho systemu
%
%   [K,T_km,ksi_km,D_km] = km_sustavy(t0,t_D,t1,t2,y_0,y_max,y_min,y_nek,u_0,u_nek,cas_simulacie)

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


function [K,T_km,ksi_km,D_km] = km_sustavy(t0,t_D,t1,t2,y_0,y_max,y_min,y_nek,u_0,u_nek,cas_simulacie)

% Normalizacia

% Cas posunut do nuly
t1=t1-t0;
t2=t2-t0;

% Posunut vystup do nuly
y_nek = y_nek-y_0;
y_max = y_max-y_0;
y_min = y_min-y_0;

% Skokova zmena
du = u_nek-u_0;

% Vystup vydeleny skokovou zmenou
y_nek = y_nek/du;
y_max = y_max/du;
y_min = y_min/du;

% Identifikacia

K = y_nek;
M = (y_max-y_min)/y_max;
ksi_km = abs(log(M)/sqrt(pi^2+log(M)^2));
P = sqrt(1-ksi_km^2);
w0_km = pi/(t2-t1)/P;
T_km = 1/w0_km;
D_km = t_D-t0;
