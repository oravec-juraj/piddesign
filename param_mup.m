% PARAM_MUP
% Sluzi na zadanie parametrov pre analyticku metodu umiestnenia polov - MUP



w0 = min(real(roots(men)));    % Najmensi koren menovatela prenosu regulovaneho systemu
w0 = w0(1);     % Zobrazi sa aspon jeden koren (pre model ziskany Strejcovou identifikaciou je to nasobny pol)
Qw0= w0;
ksi0=1;
Qksi0 =ksi0;

% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,2);

% PZMAP
pz=tf(K,men);
figure
pzmap(pz,'r')
set(gcf,'Color','white')

Qch4=uicontrol(gcf,'Tag','ptt_ch4',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',0,...    
    'Callback','grid');

figure('Color','blue',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...
          'Numbertitle','off',...
          'name',ptg_string(1,2,ptv_str_lang), ...
          'position',[150 100 240 270]);
 
%----------------------------- text ---------------------------                   
                    
       Qtext =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor','yellow',... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 210 200 40],...
          'String',ptg_string(11,20,ptv_str_lang));
      
       Qtext =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 105 200 85],...
          'String',ptg_string(11,21,ptv_str_lang));    

 %------------------------------ ksi0 ----------------------------------------         
       
       Qksi0_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[25 110 75 25],...
          'String',ptg_string(11,23,ptv_str_lang));
if(n==1&&(J3==1||J3==4))
       Qtext =  uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'Fontweight','bold',...          
          'BackgroundColor',[1 1 1],... 	
          'HorizontalAlignment','center',...         
          'Position',[102 112 110 25],...
          'String',num2str(Qksi0));
  else
       Qksi0 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qksi0),...
          'Position',[102 112 110 25],...
          'CallBack',['ic(1,1)=1;Qksi0=str2num(get(gco,''String''));']);
  end
%------------------------------- w0 ----------------------------------------          
          
       Qw0_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 70 80 25],...
          'String',ptg_string(11,24,ptv_str_lang));
      
      Qw0 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qw0) ,...
          'Position',[100 70 120 25],...
          'CallBack',['ic(1,2)=1;Qw0=str2num(get(gco,''String''));']);
     
% Vynulovanie vyberu metody - predchadza chybam sposobenych roznym poctom
% moznosti

if(typy_n>5)
    typy_n=1;
end
%   
          
       typyn = uicontrol(gcf,...
          'Style','popup',...
          'Position',[25 130 190 35],...
          'String',ptg_string(11,22,ptv_str_lang),...
          'Value',typy_n,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typy_n = get(gco,''Value'');testp');


%----SPAT-----%
navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 10 60 25],...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'Callback','close,reg_v');


%-----TLACITKO-----%

navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[100 10 120 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,1,ptv_str_lang),...
          'ForegroundColor','red',...
          'CallBack','close,test_mup');