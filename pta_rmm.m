% PTA_RMM
%
%   Experimental method for PI controller tuning by Reqiured Model Method
%
%   [zr,ti,td] = pta_rmm(typ_c,K,input_T,input_D,Max_Overshot,input_ksi_pe)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   For PI controller tunning:
%
%   [zr,ti,td] = pta_rmm(2,K,Tn,Tu,Max_Overshot)
%
%   where
%
%   K - is gain of proces model
%   Tu, Tn - are parameters from identification by Strejc
%   Max_Overshot - is required maximal overshot
%
%   For PID controller tunning for aperiodic process model:
%
%   where
%
%   [zr,ti,td] = pta_rmm(3,K,T,D,Max_Overshot)
%
%   K - is gain of proces model
%   T - is time constant of process model
%   D - is time delay of process model
%   Max_Overshot - is required maximal overshot
%
%   For PID controller tunning for damped periodic process model:
%
%   where
%
%   [zr,ti,td] = pta_rmm(3,K,T_pe,D_pe,Max_Overshot,ksi_pe)
%
%   K - is gain of proces model
%   T_pe - is time constant of process model
%   D_pe - is time delay of process model
%   Max_Overshot - is required maximal overshot
%   ksi_pe - is damping coeficient of process model



function [zr,ti,td] = pta_rmm(typ_c,K,input_T,input_D,Max_Overshot,input_ksi_pe)

% Tabule of parameter Beta for required overshot for Reqiured Model Method
%
table = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50;
    2.718, 1.944, 1.72, 1.561, 1.437, 1.337, 1.248, 1.172, 1.104, 1.045, 0.992];

beta = table(2,find(Max_Overshot==table(1,:)));

% PI Controller
%
if(typ_c == 2)

    Tn = input_T;
    Tu = input_D;

    zr = (Tn/(beta*Tu*K));
    ti = Tn;
    td = 0;

% PID Controller
%
elseif(typ_c == 3)
    
    % Aperiodic model
    %
    if(nargin == 5)
        
        T = input_T;
        D = input_D;

        ti = 2*T;
        zr = ti/(K*D*beta);
        td = T/2;

    % Damped periodic model
    %
    elseif(nargin == 6)

        T_pe = input_T;
        D_pe = input_D;
        ksi_pe = input_ksi_pe;

        ti = 2*ksi_pe*T_pe;
        zr = ti/(K*D_pe*beta);
        td = T_pe/(2*ksi_pe);

    end

end