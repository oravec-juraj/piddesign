% ID_PARAMTERE
%
%   Sluzi na vypocet identifikovanych parametrov aperiodickej PCH z
%   datoveho suboru
%
%   Spusta - SIM_IDENT, ID_PARAM



% Vypocet parametrov identifikaciou podla Strejca
%
[n,K,T,D,Tu,Tn] = ptf_strejc(yn,t);

[K,M] = get_tf(1,n,K,T);

sim_ident

% Identifikovany system je aperiodicky
%
typ_i2 = 1;

id_param