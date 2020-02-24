% ID_MODEL3
%
%   Identifikacia tlmene kmitaveho systemu pomocou identifikacie podla Strejca 

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


[K,M] = get_tf(2,ksi_km,K,T_km);
D = D_km;

sim('generujpch')

  % Premenne y,t,yn pre spracovanie pomocou STREJC a pre porovnanie
    t=pch(:,1);
    yn=pch(:,2);
    
    % Pre moznost ladenia
    %
    y_1 = yn;

% Vypocet parametrov identifikaciou podla Strejca
[n,K,T,D,Tu,Tn] = ptf_strejc(yn,t);

[K,M] = get_tf(1,n,K,T);

    % test
    sim_ident

    [Tu,Tn] = get_tu_tn(n,K,T,D,1,ptv_str_lang,fgcolor);   % Dopocitanie parametrov Tu a Tn

naspat='close,na_model';

% Identifikovany system je aperiodicky
%
typ_i2 = 1;

id_param
