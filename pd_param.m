% PD_PARAM
%
%   Sluzi na vypocet parametrov PD regulatora pomocou vybranej experimentalnej
%   metody



% METODY:
%
% COHEN-COON

if typy_ns==1
    
    z_r = (1/K)*(Tn/Tu)*((5/4)+(1/6)*(Tu/Tn));
    t_d = Tu*((6-2*(Tu/Tn))/(22+3*(Tu/Tn)));

t_i=1e10;
close
simul_param

% 
end