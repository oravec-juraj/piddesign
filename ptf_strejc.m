% Function PTF_STREJC
%
%   Function for identification by Strejc
%
%   For identification by Strejc from step response parameters
%
%   [n,K,T,D,Tu,Tn] = ptf_strejc(u_0,u_Inf,y_0,y_inf,t_0,t_D,t_1,t_2)
%
%   For identification by Strejc from step response parameters getting 
%   1st order system
%
%   [n,K,T,D,Tu,Tn] = ptf_strejc(u_0,u_Inf,y_0,y_inf,t_0,t_D,t_1,t_2,1)
%
%   For identification by Strejc from data file
%
%   [n,K,T,D,Tu,Tn] = ptf_strejc(yn,t)
%
%   For identification by Strejc getting lower oreder system
%
%   [n,K,T,D,Tu,Tn] = ptf_strejc(n,K,T,D,n_lower)

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


function [n,K,T,D,Tu,Tn] = ptf_strejc(u_0,u_Inf,y_0,y_Inf,t_0,t_D,t_1,t_2,n)

% ---------------------------------------------------------%
%
% First Order Identification
%

if(nargin==9)
    if(n==1)

        K = ((y_Inf-y_0)/(u_Inf-u_0));
        T = t_2-t_1;
        D = t_1-t_0;

        Tu = D;
        Tn = T;
        
    end

% ---------------------------------------------------------%
%
% n-th Order Identification
%

elseif(nargin==8)

    Tu = t_1-t_D;
    Tn = t_2-t_1;

    fs = Tu/Tn;

    % Tabulka pre strejcovu identifikaciu
    tab = ptf_strejc_table;

    fn = find(fs >= tab(1,:));
    fn = fn(end);
    n = fn;
    fn = tab(1,n);
    gn = tab(2,n);

    K = ((y_Inf-y_0)/(u_Inf-u_0));

    T = gn*(t_2-t_1);

    D = (((t_1-t_0)/(t_2-t_1))-fn)*(t_2-t_1);
    
    Tu = Tu + t_D;

% ---------------------------------------------------------%
%
% Identification by Strejc from data file
elseif (nargin == 2)

    % STREJC
    % Sluzi na vypocet parametrov prenosu regulovaneho systemu metodou identifikacie podla Strejcia
    % Pracuje s normalizovanym vektorom dat "yn"
    % Skript je vyvolany z ID_PARAMTERE, kam sa po skonceni skriptu vrati
    % Vyuziva pomocnu premennu "ic0", ktora informuje,
    % ci ma prebehnut normalna identifikacia - vtedy, ak neexistuje "ic0"
    % alebo identifikacia s nizsim radom (vyvolana z NIZSIEN) - vtedy, ak existuje "ic0"

    % Declaration of variables from function input
    %
    yn = u_0;
    t = u_Inf;

    K = yn(end);

    if (sum(yn)<0);
        yn = -yn;
    end   

    if(sum(find(yn<yn(1))) ~= 0)
        yn = ptf_cut_nominph(yn);
    end
    
    d1y = diff(yn);
    d1t = diff(t);
    delmat = d1y./d1t;
    max_dm = max(delmat);
    index = find(max_dm==delmat);

    bod_t1 = t(index(1)+1);
    bod_y1 = yn(index(1)+1);
    bod_t2 = t(index(1));
    bod_y2 = yn(index(1));

    a = (bod_y2 - bod_y1) / (bod_t2 - bod_t1);
    b = bod_y2 - a*bod_t2;
    Tu = ( min(yn) - b ) / a;
    Tn = ( max(yn) - b ) / a - Tu;
    
    % Tabulka pre strejcovu identifikaciu
    tab = ptf_strejc_table;

    f = Tu / Tn;
    n = find(tab(1,:) <= f);
    n = n(end);
    fn = tab(1,n);
    gn = tab(2,n);

    T = Tn * gn;
    D = (( f - fn ) * Tn);

% ---------------------------------------------------------%
%
% Identification by Strejc getting lower order system
%

elseif (nargin == 5)

    % Declaration of variables from function input
    %
    n = u_0;
    K = u_Inf;
    T = y_0;
    D =y_Inf;
    n_lower = t_0;
    
    % Tabulka pre strejcovu identifikaciu
    tab = ptf_strejc_table;
    
    if(n==1)
        
        Tn = T;
        Tu = D;

    elseif(n<=8)
        
        Tn = T/tab(2,n);
        Tu = (D/Tn + tab(1,n))*Tn;
        
    else
        disp(' Function requires loewr order! 1 < n < 9')
    end
    
    fn = tab(1,n_lower);
    gn = tab(2,n_lower);

    f = Tu/Tn;

    T = Tn * gn;
    D = (( f - fn ) * Tn);

    n = n_lower;

end