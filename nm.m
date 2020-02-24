% NM
% Nasslinova metoda - analyticka metoda syntezy regulatora
% Volane z P_V_PARAM, PI_V_PARAM alebo PID_V_PARAM

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk
% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------


  % J3 = pomocna premenna, aby Naslinova metoda - NM vedela, aky typ regulatora
  % sa ma vygenerovat:
  % J3 = 1 pre P reg
  % J3 = 2 pre PI reg
  % J3 = 3 pre PID reg
  % J3 = 4 pre PD reg
  
  % J4 = pomocna premenna, aby Naslinova metoda - NM vedela, ci sa uz
  % zadalo maximalne prereulovanie - vtedy J4 existuje a ma hodnotu 1 a
  % prejde sa rovno na vypocet parametrov regulatora, alebo J4 neexistuje a
  % vtedy sa otvori okno na zadanie maximalnehopreregulovania
  
if(exist('J4')==0)

      typy_ns2=1;

      fig2 = figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'Name',ptg_string(1,2,ptv_str_lang), ...
          'Position',[120 300 250 80]);
      navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[10 10 120 60],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','left',...
          'String',ptg_string(11,16,ptv_str_lang));
       typyns2 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[20 -25 100 60],...
          'String',ptg_string(11,19,ptv_str_lang),...
          'Value',typy_ns2,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typy_ns2 = get(gco,''Value'');');
       prenos_s = uicontrol(gcf,...
          'Style','push',...
          'Position',[150 45 80 25],...
          'String',ptg_string(3,1,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','red',...
          'CallBack','close,J4=1;nm');
    prenos_s2 = uicontrol(gcf,...
          'Style','push',...
          'Position',[150 15 80 25],...
          'String',ptg_string(3,2,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','black',...
          'CallBack','close,reg_v'); 
  else
    
 % Vypocet parametrov regulatora
 % 
 % Tabulka koeficientov SIGMA pre NASLINOVU METODU

if typy_ns2==1
    alfa=2.4;
elseif typy_ns2==2
    alfa=2.2;
elseif typy_ns2==3
    alfa=2;
elseif typy_ns2==4
    alfa=1.9;
elseif typy_ns2==5
    alfa=1.8;
elseif typy_ns2==6
    alfa=1.75;
elseif typy_ns2==7
    alfa=1.7;
end

% --- Koniec tabulky


% ---------- PRACA S PRENOSOM ----------------------------------
%
% Vypocet menovatela prenosu
% Prenos v tvare: G(s)=K(s)/menv(s)
% Menovatel v tvare: An*S^n + A(n-1)*S^(n-1) + ... + A1*S + A0
% a = a(end-n)*s^n + a(end-(n-1))*s^(n-1) +... + a(end-2)*s^2 + a(end-1)*s + a(end)
%

    if(typ_i==1)
        [Kv,menv] = get_tf(1,n,K,T);            % Strejcov tvar
    else
        [Kv,menv] = get_tf(2,ksi_km,K,T_km);    % Kmitavy tvar

        % Predelenenie kazdeho koeficientu koeficientom pri najvyssej mocnine:
        % s^n, aby sa ziskal koeficient An = 1
    
        Kv=Kv/T_km^2;
        menv=menv/T_km^2;
        n=2;
    end

a=zeros(1,n+1);
for i=1:n+1
    a(i)=menv(end+1-i);
end

% P-reg
if (n>=2&&J3==1)
   z_r = ((a(2)^2)/(alfa*a(3))-a(1))/Kv;
   t_i=1e10;
   t_d=0;

% PI-reg
elseif(n>=2&&J3==2)
    z_r = ((a(2)^2)/(alfa*a(3))-a(1))/Kv;
    t_i=(alfa*a(2)*z_r)/((a(1)+(Kv*z_r))^2);
    t_d=0;

% PID-reg
elseif(n>=3&&J3==3)
    z_r = ( ( 1/(alfa*a(3)) )*( a(2)+ ( (a(3)^2)/(alfa*a(4)) - a(2) ) )^2 -a(1))/Kv;
    t_d = (a(3)^2)/(alfa*a(4))/(Kv*z_r);
    t_i = ( Kv*z_r*alfa*( a(2) + Kv*z_r*t_d ) )/((a(1)+Kv*z_r)^2);

% PD-reg
elseif(n>=3&&J3==4)
    z_r = ( ( ( ( a(2) + ( ( a(3)^2 ) / (alfa*a(4)) -a(2) ) )^2 ) / ( alfa*a(3) ) ) - a(1) ) / Kv;
    t_d = (a(3)^2)/(alfa*a(3)-a(2))/(Kv*z_r);
    t_i = 1e10;
    
end

    clear('J4');
    simul_param; 

end