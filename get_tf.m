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