% ZISKAT_GS3
%
%   Volane zo - ZISKAT_GS
%   pre tlmene kmitavy model



QKK=KK;
QTT_km=TT_km;
Qkksi_km=kksi_km;

%------------------------------- K_km ----------------------------------------          
          
       QK_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 160 80 25],...
          'String',ptg_string(8,2,ptv_str_lang));
      
       HK =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QKK) ,...
          'Position',[102 160 80 25],...
          'CallBack',['QKK=str2num(get(gco,''String''));']);
 
          
 %------------------------------- T_km ---------------------------------------         
          
       QT_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 125 80 25],...
          'String',ptg_string(8,7,ptv_str_lang));
      
       HT =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QTT_km),...
          'Position',[102 125 80 25],...
          'CallBack',['QTT_km=str2num(get(gco,''String''));']);              

%----------------------------- ksi_km ------------------------------------------                   
                    
       Qksi_km_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 90 80 25],...
          'String',ptg_string(8,8,ptv_str_lang));
      
       Hksi_km =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qkksi_km),...
          'Position',[102 90 80 25],...
          'CallBack',['Qkksi_km=str2num(get(gco,''String''));']);      