% PTE_IAEISEM
%
%   Experimental method for controller tuning by Lopez IAE-ISE method
%
%   [zr,ti,td] = pte_iaeisem(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 1 for P Controller
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc



function [zr,ti,td] = pte_iaeisem(typ_c,K,Tu,Tn)

% P Controller
%
if(typ_c == 1)

    zr = 1.411*Tu/(K*Tn^(-0.917));
    ti = 1e10;
    td = 0;

% PI Controller
%
elseif(typ_c == 2)

    zr = 1.305*Tu/(K*Tn^(-0.959));
    ti = Tn/0.496*((Tu/Tn)^0.739);
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1.495*Tu/(K*Tn^(-0.949));
    ti = Tn/1.101*((Tu/Tn)^0.771);
    td = 0.56*Tu*((Tn/Tu)^1.006);

end
