% KM_ID
% Funkcia
% [OK,K,T_km,ksi_km,D_km] = km_id(t,y,naspat)
% Identifikacia kmitaveho priebehu z PCH
% Na vstupe predpoklada udaje prechodovej charakteristiky: t = cas, y = hodnoty PCH
% naspat = premenna, ktora v pripade chyby po zavreti CLOSE urci, kam sa program vrati
% Na vystupe je prva premenna OK, ktora sa rovna nule, OK == 0, ak sa neda
% pouzit identifikacia tlmene kmitaveho systemu



function [OK,K,T_km,ksi_km,D_km] = km_id(t,y,naspat)

if(y(end) > 0)
    % 1. bod - max. prekmit
    y_max=max(y);
    t_max=find(y==y_max);
    
    % 2. bod - nasledujuce min.
    y_min=min(y(t_max:end));
    t_min=find(y==y_min);
    
else
    % 1. bod - max. prekmit
    y_max=max(-y);
    t_max=find(y==-y_max);
    
    % 2. bod - nasledujuce min.
    y_min=min(-y(t_max:end));
    t_min=find(y==-y_min);
end

% Prepocet pozicie prvku vektora na hodnotu na danom mieste
t_max=t(t_max);
t_max=t_max(1);
t_min=t(t_min);
t_min=t_min(1);

% Parametre prenosu
K = y(end);
M=(y_max-y_min)/y_max;

% Kontrola, ci sa M == 0 => ci sa da pouzit identifikacia kmitaveho
% priebehu, ak nie, tak premenna OK == 0
if(M<=0.0001)
    K=0;
    T_km=0;
    ksi_km=0;
    D_km=0;
    
    OK = 0;
else

OK = 1;
ksi_km=abs(log(M)/(sqrt(pi^2+(log(M))^2)));
p=sqrt(1-ksi_km^2);
omega=pi/((t_min-t_max)*p);
T_km=1/omega;

if(K>0)
    D_km = t(find(y<=(K/1000)));
else
    D_km = t(find(y>=(K/1000)));
end

if(length(D_km)==0)
    D_km = 0;
else
    D_km = D_km(end);
end

end