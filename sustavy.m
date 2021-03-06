% SUSTAVY
%
%   Dava na vyber typ identifikacie:
%
%   SUSTAVA 1.RADU - PARAM
%   SUSTAVA VYSSIEHO RADU - PARAM2
%   SPAT - SUS

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


figure('Color','blue',...
             'Resize','off',...
             'Numbertitle','off',...
             'Menubar',ptv_fig_menubar,...
             'Name',ptg_string(1,3,ptv_str_lang),...
             'position',[35 120 240 150]);

% Clolourful effect
ptf_cfbcg(gcf,ptv_cfbcg)
%-------------------------------------------------------------------
  
pth_but1 = uicontrol(gcf,...
  'Style','push',...
  'Position',[30 100 180 30],...
  'String',ptg_string(3,15,ptv_str_lang),...
  'Fontsize',[11],...
  'Fontweight','bold',...
  'ForegroundColor','black',...
  'CallBack','close,param');

pth_but2 = uicontrol(gcf,...
  'Style','push',...
  'Position',[30 60 180 30],...
  'String',ptg_string(3,16,ptv_str_lang),...
  'Fontsize',[11],...  
  'Fontweight','bold',...
  'ForegroundColor','black',...
  'CallBack','close,param2');

pth_but3 = uicontrol(gcf,...
  'Style','push',...
  'Position',[30 15 60 25],...
  'String',ptg_string(3,2,ptv_str_lang),...
  'Fontsize',[11],...
  'Fontweight','bold',...
  'ForegroundColor','black',...
  'CallBack','close,sus');