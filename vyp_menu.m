% VYP_MAENU
% Menu tlacitka KONIEC umiestneneho v startovaciom okne
%

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

 fig = figure('Color',[0.71 0.59 0.5],... 
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'name',ptg_string(1,4,ptv_str_lang), ...
          'position',[100 100 400 120]);
      
         navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[15 15 370 90],...
          'Fontsize',11,...
          'ForegroundColor',[0.44 0.02 0.02],... 
          'BackgroundColor',[0.79 0.73 0.64],...
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(2,1,ptv_str_lang));
      
         potvrd1 = uicontrol(gcf,...
          'Style','push',...
          'Position',[25 25 80 25],...
          'Fontsize',11,...
          'String',ptg_string(3,6,ptv_str_lang),...
          'ForegroundColor',[0.71 0.59 0.5],... 
          'BackgroundColor',[0.51 0.1 0.22],... 
          'CallBack','pt_shutdown');
      
      potvrd2 = uicontrol(gcf,...
          'Style','push',...
          'Position',[115 25 60 25],...
          'Fontsize',11,...
          'String',ptg_string(3,7,ptv_str_lang),...
          'ForegroundColor',[0.71 0.59 0.5],...
          'BackgroundColor',[0.51 0.1 0.22],... 
          'CallBack','pt_shutdown,pt');

      potvrd3 = uicontrol(gcf,...
          'Style','push',...
          'Position',[185 25 100 25],...
          'Fontsize',11,...
          'String',ptg_string(3,8,ptv_str_lang),...
          'ForegroundColor',[0.71 0.59 0.5],... 
          'BackgroundColor',[0.51 0.1 0.22],... 
          'CallBack','close,close(findobj(''NumberTitle'',''on'')),close(findobj(''Tag'',''ptt_plot''))');
      
      potvrd4 = uicontrol(gcf,...
          'Style','push',...
          'Position',[315 25 60 25],...
          'Fontsize',11,...
          'String',ptg_string(3,9,ptv_str_lang),...
          'ForegroundColor',[0.71 0.59 0.5],... 
          'BackgroundColor',[0.51 0.1 0.22],... 
          'CallBack','close,pomoc(fgcolor)');