% PARAM_VL4
% Zadanie parametrov Strejcovho prenosu
% Volane z - PARAM_VL2, aj sa tam vrati

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


QK=K;
QT_km=T_km;
Qksi_km=ksi_km;
QD_km=D_km;

%------------------------------- K_km ----------------------------------------          
          
       QK_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 190 80 25],...
          'String',ptg_string(8,2,ptv_str_lang));
      
       HK =  uicontrol(gcf,...
          'Tag','ptt_K',...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QK) ,...
          'Position',[102 190 80 25],...
          'CallBack',['QK=str2num(get(gco,''String''));']);
 
          
 %------------------------------- T_km ---------------------------------------         
          
       QT_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 155 80 25],...
          'String',ptg_string(8,7,ptv_str_lang));
      
       HT =  uicontrol(gcf,...
          'Tag','ptt_T_km',...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QT_km),...
          'Position',[102 155 80 25],...
          'CallBack',['QT_km=str2num(get(gco,''String''));']);              

%----------------------------- ksi_km ------------------------------------------                   
                    
       Qksi_km_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 120 80 25],...
          'String',ptg_string(8,8,ptv_str_lang));
      
       Hksi_km =  uicontrol(gcf,...
          'Tag','ptt_ksi_km',...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(Qksi_km),...
          'Position',[102 120 80 25],...
          'CallBack',['Qksi_km=str2num(get(gco,''String''));']);      
 %------------------------------ D_km ----------------------------------------         
               
       QD_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...	
          'Position',[20 85 80 25],...
          'String',ptg_string(8,9,ptv_str_lang));
      
       HD =  uicontrol(gcf,...
          'Tag','ptt_D_km',...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String',num2str(QD_km),...
          'Position',[102 85 80 25],...
          'CallBack',['QD_km=str2num(get(gco,''String''));']);