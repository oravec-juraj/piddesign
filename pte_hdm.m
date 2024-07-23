% PTE_HDM
%
%   Experimental method for controller tuning by half dampping method
%
%   [zr,ti,td] = pte_hdm(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc



function [zr,ti,td] = pte_hdm(typ_c,K,Tu,Tn)

% PI Controller
%
if(typ_c == 2)

    zr = 0.928/K*(Tu/Tn)^(-0.946);
    ti = 0.928*Tn*(Tu/Tn)^0.583;
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1.37/K*(Tu/Tn)^0.95;
    ti = 0.74*Tn*(Tu/Tn)^0.738;
    td = 0.365*Tn*(Tu/Tn)^0.95;

end
