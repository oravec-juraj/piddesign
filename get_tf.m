% GET_TF
%
% Funkcia na vypocet citatela a menovcatela prenosovej funkcie
% z parametrov identifikacie podla Strejca alebo tlmene kmitavej
% identifikacie
%
% [cit,men] = get_tf(ident,n_ksi,K,T)
%
% Vstupy:
%
% ident = typ identifikacie - 1 pre Strejcovu identifikaciu a 2 pre Tlmene
% kmitavu identifikaciu
% n_ksi = pre "ident" == 1 rad system, ocakava "n_ksi" ako cele kladne cislo 
% alebo pre "ident" == 2 koeficient kmitania, ocakava 0 < "n_ksi" < 1
% K = zosinenie
% T = casova konstanta, ocakava sa kladne cislo

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


function [cit,men] = get_tf(ident,n_ksi,K,T)

if ~(isnumeric(ident)||isnumeric(n_ksi)||isnumeric(K)||isnumeric(T))
    error('Vstupovat musia cisla do funkcie [cit,men] = get_tf(ident,n_ksi,K,T)!')

else
   if(nargin~=4)
       error('Nie je dostatok vstupov pre funkciu [cit,men] = get_tf(ident,n_ksi,K,T)!')
   elseif(ident==1)&&(n_ksi<1||mod(n_ksi,1)~=0)
       error('Nekorektne zadany rad "n_ksi" pre funkciu [cit,men] = get_tf(ident,n_ksi,K,T)!')
   elseif(ident==2)&&(n_ksi>1||n_ksi<0)
       error('Nekorektne zadany koeficient tlmenia "n_ksi" pre funkciu [cit,men] = get_tf(ident,n_ksi,K,T)!')    
   elseif(T<=0)
       error('Nekorektne zadana casova konstanta "T" pre funkciu [cit,men] = get_tf(ident,n_ksi,K,T)!')           
       
   elseif(ident==1)
       cit = K;
       men = 1;
       for i=1:n_ksi
           men = conv(men,[T 1]);
       end
           
   elseif(ident==2)
       cit = K;
       men = [T^2, 2*n_ksi*T, 1];
   else
       error('Nekorektny vstup "ident" pre funkciu [cit,men] = get_tf(ident,n_ksi,K,T)!')
   end
end