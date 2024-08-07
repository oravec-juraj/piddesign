% FILTRACIA
%
%   Sluzi na nacitanie parametrov filtracie
%
%   Spusta - TESTFIL
%   SPAT - VYB_FIL
%
%   Ak uz bola vykonana nejaka filtracia, moznost  vyberu - IDENTIFIKACIA - ID_PARAMETRE
%   a predtym vykona: clear ic2,clear color,id_parametre, 
%   Kde:
%   "ic2" je pomocna premenna, ktora informuje, ze uz sa vykonala filtracia
%   Premenna "ic2" nadobuda hodnotu 1 v OBR_FILTRACIE
%   "color" je pomocna premenna, ktora meni farbu tlacitka FILTRACIA, v zavislosti od pomocnej premennej "ic2"
%   podla toho, ci bola uz vykonana filtracia a v ponuke uz je aj IDENTIFIKACIA




%--------------------------------------------------------------------------
% Kontrola, ci je nactany nejaky datovy subor, ak nie, da moznost nacitat
% Vdaka tomu je mozne volat FILTRACIA samostatne pre lubovolny datovy subor
if(exist('data')~=1)    
    ic2=0;                          % Este nebola vykonana ziadna filtracia    
    [meno,adr]=uigetfile('*.*',ptg_string(1,11,ptv_str_lang));
    if meno==0 % kvoli nazvu *.*
    else 
        data=load([adr,meno],'-ascii'); % Nacitanie datoveho suboru
        t=data(:,1);
        ynew=data(:,2);
        cas_simulacie=t(length(t));
    end
end
%--------------------------------------------------------------------------

if(exist('data')==1)

% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,3);

Qrad_filtracie =rad_filtracie;
Qomega=omega;
Qzvlnenie=zvlnenie;


close(findobj('Tag','ptt_filtration'))

% temp = findobj('Tag','ptt_filtration');
% if(isempty(temp) == 1)
%     fig = figure('Color','blue',...
%           'Resize','off',...
%           'Menubar',ptv_fig_menubar,...
%           'Numbertitle','off',...
%           'Tag','ptt_filtration',...
%           'name',ptg_string(1,14,ptv_str_lang), ...
%           'position',[110 90 380 230]);
% end

fig = figure('Color','blue',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...
          'Numbertitle','off',...
          'Tag','ptt_filtration',...
          'name',ptg_string(1,14,ptv_str_lang), ...
          'position',[110 90 380 230]);

%--------
typ_fil_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[20 180 340 45],...
          'String',ptg_string(2,13,ptv_str_lang));
      typfil_1 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[25 140 120 65],...
          'String',ptg_string(4,3,ptv_str_lang),...
          'Value',typfil(1),...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typfil(1) = get(typfil_1,''Value'');testz');
      typfil_2 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[150 140 105 65],...
          'String',ptg_string(4,4,ptv_str_lang),...
          'Value',typfil(2),...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typfil(2) = get(typfil_2,''Value'');testo');
      typfil_3 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[260 140 95 65],...
          'String',ptg_string(4,5,ptv_str_lang),...
          'Value',typfil(3),...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typfil(3) = get(typfil_3,''Value'');');

%----------------------------- rad_filtracie ------------------------------ 

       rad_filtracie_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[20 145 100 25],...
          'String',ptg_string(8,48,ptv_str_lang));

       Qrad_filtracie =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],... 
          'HorizontalAlignment','center',...
          'Fontsize',[11],...
          'String',num2str(Qrad_filtracie),...
          'Position',[120 145 100 25],...
          'CallBack',['ic(1,1)=1;Qrad_filtracie=str2num(get(gco,''String''));']);

%-------------------------------- omega ----------------------------------- 

       omega_text =  uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...		
          'Position',[20 115 100 25],...
          'String',ptg_string(8,49,ptv_str_lang));
       Qomega =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[11],...
          'String',num2str(Qomega),...
          'Position',[120 115 100 25],...
          'CallBack',['ic(1,2)=1;Qomega=str2num(get(gco,''String''));']);
      
%-------------------------------- zvlnenie ----------------------------------- 
if(typfil(1)>2)
           zvlnenie_text =  uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...		
          'Position',[20 85 100 25],...
          'String',ptg_string(8,50,ptv_str_lang));
       Qzvlnenie =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[11],...
          'String',num2str(Qzvlnenie),...
          'Position',[120 85 100 25],...
          'CallBack',['ic(1,3)=1;Qzvlnenie=str2num(get(gco,''String''));']);
  else
      zvlnenie_text =  uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor','blue',... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...		
          'Position',[20 85 200 25],...
          'String','');
  end
%--------------------------------------------------------------------------      

if(ic2==1)
    % Farba pre moznost FILTRACIA:
    color='black';
    
    % Odchylka filtracie:
    %
    if(length(ynew)~=length(yn)||size(ynew,2)~=1||size(yn,2)~=1)
        odch = -Inf;
    else
        odch=(ynew-yn)'*(ynew-yn);
    end

else
    % Farba pre moznost FILTRACIA:
    color='red';      
end
         
pokracovat = uicontrol(gcf,...
          'Style','push',...
          'Position',[240 140 120 30],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,20,ptv_str_lang),...
          'ForegroundColor',color,...
          'CallBack','close,testfil');
      
%-----------------------------------------------------
% Ak uz bola vykonana aspon jedna filtracia:

    if(ic2==1)
        pokracovat3 = uicontrol(gcf,...
          'Style','push',...
          'Position',[240 110 120 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,21,ptv_str_lang),...
          'ForegroundColor','blue',...
          'CallBack','clear color,ulozit');
      
        pokracovat4 = uicontrol(gcf,...
          'Style','push',...
          'Position',[240 75 120 30],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String',ptg_string(3,4,ptv_str_lang),...
          'ForegroundColor','red',...
          'CallBack','typ_i=get(findobj(''Tag'',''ptt_periodic''),''Value'')+1;close,naspat=''close,filtracia'';if(typ_i==1),id_parametre,else,[OK,K,T_km,ksi_km,D_km] = km_id(t,yn,naspat);param_km,end');

%--- Vyber identifikacie kmitaveho priebehu ----------------------------------------------------
typ_i = 0;
Qtyp_i=uicontrol(gcf,'Tag','KM',...
    'Style','Check','Units','Pixels','Position',[220 50 140 20],...
    'ForegroundColor','Black',...
    'Tag','ptt_periodic',...
    'BackgroundColor',fgcolor,...  
    'Fontweight','bold',...
    'String',ptg_string(5,3,ptv_str_lang),...
    'Value',typ_i,...
    'Callback','typ_i=get(gco,''Value'')+1;');

%-------- Vypis odchylky filtracie      
        odch_text =  uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...		
          'Position',[100 10 150 25],...
          'String',ptg_string(8,51,ptv_str_lang));
        odch_text2 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[12],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(odch),...
          'Position',[250 10 105 25],...
          'CallBack','set(gco,''String'',num2str(odch))');
  end
%------------------------------    
navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 10 60 30],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'Callback','close,vyb_fil');
  end