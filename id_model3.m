% ID_MODEL3
%
%   Identifikacia tlmene kmitaveho systemu pomocou identifikacie podla Strejca 



[K,M] = get_tf(2,ksi_km,K,T_km);
D = D_km;

sim('generujpch')

  % Premenne y,t,yn pre spracovanie pomocou STREJC a pre porovnanie
    t=pch(:,1);
    yn=pch(:,2);
    
    % Pre moznost ladenia
    %
    y_1 = yn;

% Vypocet parametrov identifikaciou podla Strejca
[n,K,T,D,Tu,Tn] = ptf_strejc(yn,t);

[K,M] = get_tf(1,n,K,T);

    % test
    sim_ident

    [Tu,Tn] = get_tu_tn(n,K,T,D,1,ptv_str_lang,fgcolor);   % Dopocitanie parametrov Tu a Tn

naspat='close,na_model';

% Identifikovany system je aperiodicky
%
typ_i2 = 1;

id_param
