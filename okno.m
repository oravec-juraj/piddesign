% OKNO
%
%   Otvori sa uvodne okno programu
%
%   Dava na vyber:
%
%   IDENTIFIKACIA - VYB_IDENT
%   SYNTEZA REGULATORA - PARAM_VL2
%   KONIEC - VYP_MENU

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


% Test,ci uz nie je spustenz PIDTOOL
if(isempty(findobj('Tag','pt'))==0)
fig = figure('Color','red',...
          'Resize','off',...
          'Numbertitle','off',...
          'name',ptg_string(1,7,ptv_str_lang), ...
          'Menubar',ptv_fig_menubar,...          
          'position',[100 100 315 120]);
    
    % Clolourful effect
    ptv_cfbcg = get(findobj('Tag','pt'),'UserData');
    if(ptv_cfbcg==1)
        ptf_cfbcg(gcf,2)
    end

      HT1= uicontrol(gcf,...
          'Style','text',...
          'position',[15 10 285 100],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(2,3,ptv_str_lang));
      HB1 = uicontrol(gcf,...
          'Style','push',...
          'Position',[45 20 90 25],...
          'Fontsize',[11],...
          'String',ptg_string(3,7,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','red',...
          'CallBack','close all,okno');
      HB2 = uicontrol(gcf,...
          'Style','push',...
          'Position',[175 20 90 25],...
          'Fontsize',[11],...
          'String',ptg_string(3,23,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','black',...
          'CallBack','close');
  else
% --- Koniec testu spustenia programu --- %

figure('Color','white',...
             'Tag','pt',...
             'Resize','off',...
             'Numbertitle','off',...
             'Menubar',ptv_fig_menubar,...  
             'Name',ptg_string(1,1,ptv_str_lang), ...
             'position',[100 100 500 250]);

% Effect variable
set(findobj('Tag','pt'),'UserData',ptv_cfbcg);
         
% --- UIMENU PIDTOOL --- %
h=uimenu(gcf,'Label',ptg_string(7,1,ptv_str_lang));
     uimenu(h,'Label',ptg_string(7,4,ptv_str_lang),'CallBack','if(J1==1),J2=1;zatv,else,J1=1;vyb_ident,end');
     uimenu(h,'Label',ptg_string(7,3,ptv_str_lang),'CallBack','if(J1==1),J2=2;zatv,else,J1=1;param_vl2,end');
     uimenu(h,'Label',ptg_string(7,5,ptv_str_lang),'CallBack','if(J1==1),J2=4;zatv,else,J1=1;filtracia,end');
     uimenu(h,'Label',ptg_string(7,6,ptv_str_lang),'CallBack','if(J1==1),J2=3;zatv,else,J1=1;simul_param,end');
h2=uimenu(gcf,'Label',ptg_string(7,11,ptv_str_lang));


    % Generovanie aktualneho zoznamu jazykov
    h3=uimenu(h2,'Label',ptg_string(7,2,ptv_str_lang));
    h22 = ptf_string_uimenu(h3,ptg_string_list);
    
    if(isempty(ptv_cfbcg))
        ptv_cfbcg = 0;
    end
    h4=uimenu(h2,'Label',ptg_string(7,12+ptv_cfbcg,ptv_str_lang),'CallBack','if(ptv_cfbcg),ptv_cfbcg=0;else,ptv_cfbcg=1;end,set(findobj(''Tag'',''pt''),''UserData'',ptv_cfbcg);set(h4,''Label'',ptg_string(7,12+ptv_cfbcg,ptv_str_lang))');

    uimenu(h2,'Label',ptg_string(7,14,ptv_str_lang),'CallBack','dlog2html(''pt_dlog.html'',load(''pt_dlogid.txt''),ptv_str_lang,1);');
    uimenu(h2,'Label',ptg_string(7,10,ptv_str_lang),'CallBack','pomoc(ptv_str_lang,fgcolor)');
    uimenu(h2,'Label',ptg_string(7,9,ptv_str_lang),'CallBack','close(findobj(''NumberTitle'',''on'')),close(findobj(''Tag'',''ptt_plot''))');     
    uimenu(h2,'Label',ptg_string(7,8,ptv_str_lang),'CallBack','pt_shutdown,pt');
    uimenu(h2,'Label',ptg_string(7,7,ptv_str_lang),'CallBack','pt_shutdown');
% --- Koniec - UIMENU PIDTOOL --- %     

% --- Farba okna ---%
ptf_cfbcg(gcf,1)
% --- Koniec - Farba okna ---%

%--------------------------------------------------------------------------

HT3 = uicontrol(gcf,...
  'Style','text',...
  'ForegroundColor','blue',...
  'BackgroundColor','blue',... 	
  'Position',[110 180 300 50],...
  'String','');

HT4 = uicontrol(gcf,...
  'Style','text',...
  'ForegroundColor','red',...
  'BackgroundColor','white',... 	
  'Position',[120 190 280 30],... 
  'Fontsize',[13],...
  'Fontangle','italic',...
  'Fontweight','bold',...
  'HorizontalAlignment','center',...
  'String',ptg_string(1,1,ptv_str_lang));

%--------------------------------------------------------------------------

HB3 = uicontrol(gcf,...
  'Style','push',...
  'Position',[30,90,200,30],...
  'Fontweight','bold',...  
  'String',ptg_string(3,4,ptv_str_lang),...
  'Fontsize',[11],...
  'ForegroundColor','blue',...
  'CallBack','if(J1==1),J2=1;zatv,else,vyb_ident,end');
 
%--------------------------------------------------------------------------

HB4 = uicontrol(gcf,...
  'Style','push',...
  'Position',[270,90,200,30],...
  'Fontsize',[11],...
  'Fontweight','bold',...  
  'String',ptg_string(3,3,ptv_str_lang),...
  'ForegroundColor','red',...
  'CallBack','if(J1==1),J2=2;zatv,else,param_vl2,end');

%--------------------------------------------------------------------------

HB5 = uicontrol(gcf,...
  'Style','push',...
  'Position',[200 15 100 25],...
  'Fontweight','bold',...  
  'String',ptg_string(3,5,ptv_str_lang),...
  'ForegroundColor','black',...
  'CallBack','vyp_menu');

end