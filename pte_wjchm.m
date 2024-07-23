% PTE_WJCHM
%
%   Experimental method for controller tuning by Wang-Juang-Chang method 
%
%   [zr,ti,td] = pte_wjchm(typ_c,K,Tu,Tn)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc
%



function [zr,ti,td] = pte_wjchm(typ_c,K,Tu,Tn)

% PID Controller
%
if(typ_c == 3)
    
    zr = ( (0.7307+0.5307*(Tn/Tu))*(Tn+0.5*Tu) )/ ( K*(Tn+Tu) );
    ti = Tn+0.5*Tu;
    td = 0.5*Tn*Tu/ (Tn+0.5*Tu);

end
