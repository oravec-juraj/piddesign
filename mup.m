% MUP
% Metoda umiestnenia polov
% Analyticka metoda syntezy regulatora
%



% ---------- PRACA S PRENOSOM ----------------------------------
%
% Vypocet menovatela prenosu
% Prenos v tvare: G(s)=K(s)/menv(s)
% Menovatel v tvare: An*S^n + A(n-1)*S^(n-1) + ... + A1*S + A0
% a = a(end-n)*s^n + a(end-(n-1))*s^(n-1) +... + a(end-2)*s^2 + a(end-1)*s + a(end)
%

    if(typ_i==1)
        [Kv,menv] = get_tf(1,n,K,T);    % Strejcov tvar
    else
        [Kv,menv] = get_tf(2,ksi_km,K,T_km);    % Kmitavy tvar
        n=2;
    end

% Predelenenie kazdeho koeficientu koeficientom pri najvyssej mocnine:
% s^n, aby sa ziskal koeficient An = 1

Kv = Kv/menv(1);
menv = menv/menv(1);
        
a=zeros(1,n+1);
for i=1:n+1
    a(i)=menv(end+1-i);
end

% P reg
if (n==1&&J3==1)
    z_r=(ref(1)-a(1))/Kv;
    t_i=1e10;
    t_d=0;
    simul_param;
end

% P reg - s0
if (n==2&&J3==1)
    s0=ref(2)-a(1);
    s0=-s0;
    if(s0>=0)
        pth_fig = mup_info(2,s0,fgcolor,ptv_str_lang,ptv_cfbcg);
    else
        pth_fig = mup_info(1,s0,fgcolor,ptv_str_lang,ptv_cfbcg);
        
        z_r=(ref(1)-a(1)*s0)/Kv;
        t_i=1e10;
        t_d=0;
        simul_param;
    end
end
    
% PI reg
if (n==1&&J3==2)
    z_r = (ref(2)-a(1))/Kv;
    t_i = Kv*z_r/ref(1);
    t_d = 0;
    simul_param;
end

% PI reg - s0
if (n==2&&J3==2)
    s0=ref(3)-a(1);
    s0=-s0;
    if(s0>=0)
        pth_fig = mup_info(2,s0,fgcolor,ptv_str_lang,ptv_cfbcg);
    else
        pth_fig = mup_info(1,s0,fgcolor,ptv_str_lang,ptv_cfbcg);

        z_r=(ref(2)-a(1)*s0)/Kv;
        t_i=Kv*z_r/ref(1);
        t_d=0;
        simul_param;
    end
end
    
    
% PID reg
if (n==2&&J3==3)
    z_r=(ref(2)-a(1))/Kv;
    t_i=Kv*z_r/ref(1);
    t_d=(ref(3)-a(2))/Kv/z_r;
    simul_param;
end

% PID reg - s0
if (n==3&&J3==3)
    s0=ref(4)-a(2);
    s0=-s0;
    if(s0>=0)
          pth_fig = mup_info(2,s0,fgcolor,ptv_str_lang,ptv_cfbcg);
    else
        pth_fig = mup_info(1,s0,fgcolor,ptv_str_lang,ptv_cfbcg);

        z_r=(ref(2)-a(1)*s0)/Kv;
        t_i=Kv*z_r/ref(1);
        t_d=(ref(3)-a(1)-a(2)*s0)/Kv/z_r;
        simul_param;
    end
end
    
% PD reg
if (n==2&&J3==4)
    z_r=(ref(1)-a(1))/Kv;
    t_i=1e10;
    t_d=(ref(2)-a(2))/Kv/z_r;
    simul_param;
end

% PD reg - s0
if (n==3&&J3==4)
    s0=ref(3)-a(2);
    s0=-s0;

    if(s0>=0)
          pth_fig = mup_info(2,s0,fgcolor,ptv_str_lang,ptv_cfbcg);
    else
        pth_fig = mup_info(1,s0,fgcolor,ptv_str_lang,ptv_cfbcg);

        z_r=(ref(1)-a(1)*s0)/Kv;
        t_i=1e10;
        t_d=(ref(2)-a(1)-a(2)*s0)/z_r;
        simul_param;
    end
end
    
    