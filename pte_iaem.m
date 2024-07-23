% PTE_IAEM
%
%   Experimental method for controller tuning by Minimum IAE method
%
%   [zr,ti,td] = pte_iaem(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc



function [zr,ti,td] = pte_iaem(typ_c,K,Tu,Tn)

% PI Controller
%
if(typ_c == 2)

    zr = 0.758/K*(Tu/Tn)^(-0.861);
    ti = Tn^2/(1.020*Tn + (-0.323)*Tu);
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1.086/K*(Tu/Tn)^(-0.869);
    ti = Tn^2/(0.740*Tn + (-1.130)*Tu);
    td = Tn*0.348*(Tu/Tn)^0.914;

end
