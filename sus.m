% SUS
%
%   Zadanie parametrov identifikacie z vlastnych parametrov
%
%   Vyuziva - SUS2, SUS3
%
%   Supsta - TESTID

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


Qu_0=u_0;
Qu_nek=u_nek;
Qy_0=y_0;
Qy_nek=y_nek;
Qt0=t0;
Qt1=t1;
Qt2=t2;
Qcas_simulacie =cas_simulacie;

% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,11);

fig = figure('Color','blue',...
             'Resize','off',...
             'Numbertitle','off',...
             'Tag','ptt_sus',...
             'Menubar',ptv_fig_menubar,...
             'name',ptg_string(1,9,ptv_str_lang), ...
             'position',[350 65 220 415]);

% % Clolourful effect
% ptf_cfbcg(gcf,ptv_cfbcg)

Qtext =  uicontrol(gcf,...
  'Style','text',...
  'ForegroundColor','black',...
  'BackgroundColor','green',...
  'Fontweight','bold',...
  'Fontsize',[12],...
  'Position',[20 345 180 50],...
  'String',ptg_string(2,11,ptv_str_lang));

typpch = uicontrol(gcf,...
          'Style','popup',...
          'Position',[30 340 160 35],...
          'String',ptg_string(4,2,ptv_str_lang),...
          'Value',typ_i,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typ_i = get(gco,''Value'');if(typ_i==1),sus2,elseif(typ_i)==2,sus3,end;');

%----SPAT-----%

navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 15 60 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','close,close(findobj(''Tag'',''ptt_ilustr_plot'')),vyb_ident');

%-------IDENTIFIKOVAT-------%

navrat = uicontrol(gcf,...
  'Style','push',...
  'Position',[90 15 120 25],...
  'String',ptg_string(3,4,ptv_str_lang),...
  'Fontweight','bold',...
  'Fontsize',[11],...
  'ForegroundColor','red',...
  'CallBack','close,close(findobj(''Tag'',''ptt_ilustr_plot'')),testid');

if(typ_i)==1       % Aperiodicka PCH
    sus2
elseif(typ_i)==2   % Tlmene kmitava PCH
    sus3
end