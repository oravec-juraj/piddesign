% ID_PARAM
%
%   Zobrazuje dalsie moznosti identifikacie,
%
%   Spusta:
%
%   Zadanie parametrov modelu regulovaneho procesu - PARAM_VL2
%
%   Podla okolnosti dava na vyber:
%
%   POROVNAT - POROVNAT
%   IDENTIFIKACIA S NIZSIM RADOM - NIZSIEN
%   SPAT - premenna NASPAT



if(typ_i==0)
    typ_i = 1;
end

naspat = ['close(findobj(''Tag'',''ptt_param'')),close(findobj(''Tag'',''ptt_plot'')),',naspat];
close(findobj('Tag','ptt_id_param'))

figure('Color','blue',...
          'Tag','ptt_id_param',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...
          'Numbertitle','off',...
          'name',ptg_string(1,3,ptv_str_lang), ...
          'position',[400 100 290 240]);

% Clolourful effect
ptf_cfbcg(gcf,ptv_cfbcg)

if(exist('odchylka')==1)
    
    odchylka_text = uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',fgcolor,... 	
          'Position',[20 195 250 25],...
          'String',ptg_string(2,10,ptv_str_lang));
      
       odchylka_text = uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',ptf_semaph(abs(odchylka),1, 0.001, 0.005,ptv_cfbcg),...
          'Position',[20 170 250 25],...
          'String',num2str(odchylka) ,...
          'CallBack','set(gco,''String'',num2str(odchylka))');

 
  end
%------- Koniec Chyba identifikacie --------------------

%
% Identification Tunning
%
% id_tune
% id_tune_pe
%
pokracovat4 = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 135 250 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,24,ptv_str_lang),...
          'ForegroundColor','black');
if(typ_i==1) % Strejc method
    set(pokracovat4,'CallBack','y_backup = y_1;id_backup = [n;K;T;D;Tu;Tn];close(findobj(''Tag'',''ptt_id_param'')),close(findobj(''Tag'',''ptt_plot'')),naspat=''id_param'';close(findobj(''Tag'',''id_tune'')),global tang,tang=[Tu,0;Tu+Tn,K];t_id=t;y_norm = y_1;y_id=yn;id_tune(''s0'',t,y_norm,t,y_id,id_backup)');
end
if(typ_i==2) % Damped periodic method
    y_1 = y_norm_plot(:,1); % Backup of Normalised Step Resonse
    set(pokracovat4,'CallBack','y_backup = y_1;id_backup = [K,T_km,ksi_km,D_km];close(findobj(''Tag'',''ptt_id_param'')),close(findobj(''Tag'',''ptt_plot'')),naspat=''id_param'';close(findobj(''Tag'',''id_tune'')),t_id=t;y_norm = y_1;y_id=yn;id_tune_pe(''s0'',t,y_norm,t,y_id,id_backup)');
end

pokracovat3 = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 95 250 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,17,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','if(typ_i)==1,DD2=D;if(exist(''Tu'')==1),TTu=Tu;end,if(exist(''Tn'')==1),TTn=Tn;end,[K,M]=get_tf(1,n,K,T);else,[K,M]=get_tf(2,ksi_km,K,T_km);DD2=D_km;end,naspat_porovn=''close,id_param'';porovnat'); 
      
if(typ_i==1)
      pokracovat2 = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 60 250 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,18,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),naspat=''id_param'';nizsien');
end

navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 20 80 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack',naspat);

param_vl2