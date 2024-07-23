% PTE_STREJC
%
%   Experimental method for controller tuning by Strjec method
%
%   [zr,ti,td] = pte_strejc(typ_c,n,K,T)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 1 for P Controller
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   n - is order of proces model
%   K - is gain of proces model
%   T - is time constant of proces model




function [zr,ti,td] = pte_strejc(typ_c,n,K,T)

ti = 1e10;
td = 0;

% P
%
if(typ_c==1)

    zr = (1/K)*(1/(n-1));

% PI
%
elseif(typ_c==2)

    zr = (1/K)*((n+2)/(4*(n-1)));
    ti = T*((n+2)/3);

% PID
%
else(typ_c==3)

    zr = (1/K)*(((7*n)+16)/(16*(n-2)));
    ti = T*(((7*n)+16)/15);
    td = T*(((n+1)*(n+3))/((7*n)+16));

end