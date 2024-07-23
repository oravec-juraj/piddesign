% PTE_TSR
%
%   Experimental method for controller tuning by T-sum rule by Kuhn
%
%   [zr,ti,td] = pte_tsr(typ_m,typ_c,n,K,T)
%
%   where
%
%   typ_m - is variable for choice of the controled model type
%       typ_m == 2:
%
%                K
%      G(s) = -------*exp(-Ds)
%               T*s+1
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   n - is order of proces model 
%   K - is gain of proces model
%   T - is time constant of proces model
%
%   2011.06.20.
%


function [zr,ti,td] = pte_tsm(typ_m,typ_c,n,K,T)

if(typ_m == 2)

% Additional controller tuning parameter T_SUM
%
t_sum = n*T;

% PI Controller
%
if(typ_c == 2)

    zr = 0.5/K;
    ti = 0.5*t_sum;
    td = 0;

% PID Controller
%
elseif(typ_c == 3)

    zr = 1/K;
    ti = 0.66*t_sum;
    td = 0.167*t_sum;

end

% --- %

else
    
    zr = Inf;
    ti = Inf;
    td = Inf;

end