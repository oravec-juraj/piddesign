% NA_MODEL3
%
% Volany z NA_MODEL na doplnenie vstupov, pre premennu TYP_ID==2
% Zadaju sa parametre Strejcovho prenosu regulovaneho modelu
%
% Vrati sa spat do NA_MODEL



Qn=n;
QK=K;
QT=T;
QD=D;
Qcas_simulacie =cas_simulacie;

%----- PREKRYTIE POVODNYCH VSTUPOV -----%
Qtext =  uicontrol(gcf,...
          'Style','text',...
          'BackgroundColor',get(gcf,'Color'),... 
          'Position',[20 80 240 145]);

%----------------------------- n ------------------------------------------                   
                    
       Qn_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 195 80 25],...
          'String',ptg_string(8,1,ptv_str_lang));
      
       Qn2 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qn),...
          'Position',[102 195 80 25],...
          'CallBack',['Qn=str2num(get(gco,''String''));']);
      
%------------------------------- K ----------------------------------------          
          
       QK_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 160 80 25],...
          'String',ptg_string(8,2,ptv_str_lang));
      
       QK2 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QK) ,...
          'Position',[102 160 80 25],...
          'CallBack',['QK=str2num(get(gco,''String''));']);
 
          
 %------------------------------- T ---------------------------------------         
          
       QT_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 125 80 25],...
          'String',ptg_string(8,3,ptv_str_lang));
      
       QT2 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QT),...
          'Position',[102 125 80 25],...
          'CallBack',['QT=str2num(get(gco,''String''));']);              

      
 %------------------------------ D ----------------------------------------         
               
       QD_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[20 90 80 25],...
          'String',ptg_string(8,4,ptv_str_lang));
      
       QD2 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QD),...
          'Position',[102 90 80 25],...
          'CallBack',['QD=str2num(get(gco,''String''));']);