% TESTN
%
%   Testuje parametre zadane v NIZSIEN
%   Ak su zadane parametre v poriadku, spusti sa NIZSIEN2, ID_PARAM

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


if(sum(ic)~=1||test_cor(n2)~=1)
    pth_fig = ptg_error('nizsien',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
    
elseif (mod(n2,1)~=0||n2<1)
    pth_fig = ptg_error('nizsien',ptg_string(9,2,ptv_str_lang),ptv_str_lang);
    
elseif(n2>n_max)
    pth_fig = ptg_error('nizsien',ptg_string(9,38,ptv_str_lang),ptv_str_lang);

else

    % Porovnanie
    %
    if(typ_i==1)
        [K,M] = get_tf(1,n,K,T);            % Strejcov model
        DD2=D;
    else
        [K,M] = get_tf(2,ksi_km,K,T_km);    % Kmitavy tvar
        DD2=D_km;
        n=2;
    end
    
    [n,K,T,D,Tu,Tn] = ptf_strejc(n,K,T,D,n2);

    [L,N] = get_tf(1,n,K,T);
    DD = D;

    nizsien2
    id_param
    
end