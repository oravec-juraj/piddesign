% NA_MODEL2
%
% Volany z NA_MODEL na doplnenie vstupov, pre premennu TYP_ID==1
% Zadaju sa parametre vseobecneho prenosu regulovaneho modelu
%
% Vrati sa spat do NA_MODEL



Qcit=cit;
Qmen=men;
QD=D;
Qcas_simulacie =cas_simulacie;

% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,4);
     
%----- PREKRYTIE POVODNYCH VSTUPOV -----%
Qtext =  uicontrol(gcf,...
          'Style','text',...
          'BackgroundColor',get(gcf,'Color'),... 
          'Position',[20 80 240 145]);
      
%----------------------------- cit ------------------------------------------                   
                    
       Qcit_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 195 60 25],...
          'String',ptg_string(8,14,ptv_str_lang));      
       Qcit =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qcit),...
          'Position',[80 195 180 25],...
          'CallBack',['ic(1,1)=1;Qcit=str2num(get(gco,''String''));']);
      
%------------------------------- men ----------------------------------------          
          
       Qmen_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 160 60 25],...
          'String',ptg_string(8,15,ptv_str_lang));
      
       Qmen =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qmen) ,...
          'Position',[80 160 180 25],...
          'CallBack',['ic(1,2)=1;Qmen=str2num(get(gco,''String''));']);
 
 %------------------------------ D ----------------------------------------         
               
       QD_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[20 125 60 25],...
          'String',ptg_string(8,4,ptv_str_lang));
      
       QD =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QD),...
          'Position',[80 125 180 25],...
          'CallBack',['ic(1,3)=1;QD=str2num(get(gco,''String''));']);
      
%--- KMITAVA IDENTIFIKCIA ---------
if(typ_i>1)
    typ_i =1;
end

QKM=uicontrol(gcf,'Tag','KM',...
    'Style','Check','Units','Pixels','Position',[20 90 240 25],...
    'ForegroundColor','Black',...
    'BackgroundColor',fgcolor,...  
    'Fontweight','bold',...
    'String',ptg_string(5,3,ptv_str_lang),...
    'Value',typ_i,...
    'Callback','typ_i = get(gco,''Value'');');