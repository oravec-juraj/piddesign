% SIMUL_P
%
%   Spusti schemu SIMUL na testovanie kvality regulacie
%
%   Spusta ISE_IAE_PARAM



% Vypocet citatela a menovatela prenou regulovaneho systemu
% Gs(s)=C/M
%
C=cit;
M=men;

% Spustenie simulacnej schemy:
sim('simul')

% PZMAP
figure
cit2 = cit;
men2 = men;
    if(Dr>0)    % Aproximacia D
        cit2 = conv(cit2,[-Dr, 2]);
        men2 = conv(men2,[Dr, 2]);
    end
pz = tf(cit2,men2);
pr = tf([z_r*t_d z_r z_r/t_i],[1 0]);
uro = (pz*pr)/(1+pz*pr);
uro = minreal(uro);
pzmap(uro,'r')
set(gcf,'Color','white')

Qch4=uicontrol(gcf,'Tag','ptt_ch4',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',0,...    
    'Callback','grid');


%------- Spracovanie vysledkov zo simulacnej schemy: ------
%
%
%--------------------- Akcna velicina ----------------------------------%
t_akc=akcnavel(:,1);
y1_akc=akcnavel(:,2);
y2_akc=akcnavel(:,3);
y3_akc=akcnavel(:,4);
%
% Graficky priebeh
%
figure('position',[580 60 560 420],'Color','white'); 

Qch1=uicontrol(gcf,'Tag','ptt_ch1',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_uL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch1''),ptf_checkval(''ptt_ch2''),{[t_akc,y3_akc],[t_akc,y1_akc],[t_akc,y2_akc],{''green'',''red'',''blue''}},[2,3,5],[11,12,13],ptv_str_lang)');

Qch2=uicontrol(gcf,'Tag','ptt_ch2',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_uG,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch1''),ptf_checkval(''ptt_ch2''),{[t_akc,y3_akc],[t_akc,y1_akc],[t_akc,y2_akc],{''green'',''red'',''blue''}},[2,3,5],[11,12,13],ptv_str_lang)');

ptg_plot_check(ptf_checkval('ptt_ch1'),ptf_checkval('ptt_ch2'),{[t_akc,y3_akc],[t_akc,y1_akc],[t_akc,y2_akc],{'green','red','blue'}},[2,3,5],[11,12,13],ptv_str_lang);

%--------------------- Riadena velicina ---------------------------------%
t_sim=sim_data(:,1);
y_sim=sim_data(:,2);
hh=sim_data(:,3);
dh=sim_data(:,4);
zh=sim_data(:,5);
y_sim2=sim_data(:,6);
%
% Regulacny priebeh
%
figure('position',[10 60 560 420],'Color','white');

Qch3=uicontrol(gcf,'Tag','ptt_ch3',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch3''),ptf_checkval(''ptt_ch4''),{[t_sim,y_sim2],[t_sim,y_sim],[t_sim,hh],[t_sim,dh],[t_sim,zh],{''green'',''blue'',''cyan--'',''yellow--'',''red''}},[1,3,4],[6 7 8 9 10],ptv_str_lang)');

Qch4=uicontrol(gcf,'Tag','ptt_ch4',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch3''),ptf_checkval(''ptt_ch4''),{[t_sim,y_sim2],[t_sim,y_sim],[t_sim,hh],[t_sim,dh],[t_sim,zh],{''green'',''blue'',''cyan--'',''yellow--'',''red''}},[1,3,4],[6 7 8 9 10],ptv_str_lang)');

ptg_plot_check(ptf_checkval('ptt_ch3'),ptf_checkval('ptt_ch4'),{[t_sim,y_sim2],[t_sim,y_sim],[t_sim,hh],[t_sim,dh],[t_sim,zh],{'green','blue','cyan--','yellow--','red'}},[1,3,4],[6 7 8 9 10],ptv_str_lang);

%--------------------- Koniec - Riadena velicina ------------------------%

% Stability Test
%
if(ptf_cl(C,M,[z_r*t_d, z_r, z_r/t_i],[1 0],Dr) == -1)
    pth_fig = ptg_error('',ptg_string(9,44,ptv_str_lang),ptv_str_lang);
elseif(ptf_cl(C,M,[z_r*t_d, z_r, z_r/t_i],[1 0],Dr) == 0)
    pth_fig = ptg_error('',ptg_string(9,43,ptv_str_lang),ptv_str_lang);
end


% Parametre kvality:
%
ise_iae_param