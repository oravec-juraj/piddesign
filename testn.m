% TESTN
%
%   Testuje parametre zadane v NIZSIEN
%   Ak su zadane parametre v poriadku, spusti sa NIZSIEN2, ID_PARAM



if(sum(ic)~=1||test_cor(n2)~=1)
    pth_fig = ptg_error('nizsien',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
    
elseif (mod(n2,1)~=0||n2<1)
    pth_fig = ptg_error('nizsien',ptg_string(9,2,ptv_str_lang),ptv_str_lang);
    
elseif(n2>n_max)
    pth_fig = ptg_error('nizsien',ptg_string(9,38,ptv_str_lang),ptv_str_lang);

else

    % Porovnanie
    %
    if(typ_i==1)
        [K,M] = get_tf(1,n,K,T);            % Strejcov model
        DD2=D;
    else
        [K,M] = get_tf(2,ksi_km,K,T_km);    % Kmitavy tvar
        DD2=D_km;
        n=2;
    end
    
    [n,K,T,D,Tu,Tn] = ptf_strejc(n,K,T,D,n2);

    [L,N] = get_tf(1,n,K,T);
    DD = D;

    nizsien2
    id_param
    
end