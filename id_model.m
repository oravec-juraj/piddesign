% ID_MODEL
%
%   Identifikacia zo vseobecneho prenosu



sim('generujpch')

% Identifikacia
    
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
    
    naspat='close,na_model';

    id_param