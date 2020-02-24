% POROVNAT
%
% Zadaju sa parametre  prenosu regulovaneho modelu
%
% SPUSTA - TEST_POROV pre vseobecny prenos alebo
%        - TEST_POROV2 pre Strejcov prenos
%        - TEST_POROV3 pre Tlmene kmitavy system
%        - SPAT - zatvori sa

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


% Generovanie nasho prenosu, ktory budeme porovnavat so zadanym
%
if(typ_i==1)
    [K,M] = get_tf(1,n,K,T);            % Strejcov model
    DD2=D;
else
    [K,M] = get_tf(2,ksi_km,K,T_km);    % Kmitavy tvar
    DD2=D_km;
    n=2;
end

Qcit=cit;
Qmen=men;
QD=D;
Qcas_simulacie =cas_simulacie;

ic = zeros(2);

close(findobj('Tag','ptt_compare'))
close(findobj('Tag','ptt_param'))

figure('Color','blue',...
          'Resize','off',...
          'Tag','ptt_compare',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'name',ptg_string(1,16,ptv_str_lang), ...
          'position',[150 100 280 350]);

% Clolourful effect
ptf_cfbcg(gcf,ptv_cfbcg)

%----- Info -----%
       Qtext =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor','green',... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 290 240 50],...
          'String',ptg_string(2,15,ptv_str_lang)); 

%--------------- Vyber typu prenosu ----------------------
typid = uicontrol(gcf,...
          'Style','popup',...
          'Position',[30 280 220 35],...
          'String',ptg_string(4,6,ptv_str_lang),...
          'Value',typ_id,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typ_id = get(gco,''Value'');if(typ_id)==1,porov2,elseif(typ_id)==2,porov3,elseif(typ_id)==3,porov4,end;');

%----- Info -----%
       Qtext =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor','yellow',... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[20 230 240 40],...
          'String',ptg_string(2,16,ptv_str_lang));
      

%------- cas_simulacie ---------- 
Qcas_simulacie_text =  uicontrol(gcf,...
  'Style','text',...
  'ForegroundColor','black',...
  'BackgroundColor',[fgcolor],... 	
  'Fontweight','bold',...
  'Fontsize',[12],...
  'Position',[20 55 120 25],...
  'String',ptg_string(8,23,ptv_str_lang));

Hcas_simulacie =  uicontrol(gcf,...
  'Style','edit',...
  'ForegroundColor','black',...
  'Fontsize',[12],...
  'BackgroundColor',[1 1 1],... 	
  'Fontsize',[12],...
  'String', num2str(Qcas_simulacie),...
  'Position',[140 55 120 25],...
  'CallBack',['Qcas_simulacie=str2num(get(gco,''String''));']);

%----SPAT-----%
navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 10 80 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','close,param_vl2');

vykreslit = uicontrol(gcf,...
          'Style','push',...
          'Position',[145 10 115 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,22,ptv_str_lang),...
          'ForegroundColor','red',...
          'CallBack','close,if(typ_id)==1,test_porov,elseif(typ_id)==2,test_porov2,elseif(typ_id)==3,test_porov3,end;');

if(typ_id)==1       % Vseobecny tvar
    porov2
elseif(typ_id)==2   % Strejcov tvar
    porov3
elseif(typ_id)==3   % Kmitavy tvar
    porov4    
end