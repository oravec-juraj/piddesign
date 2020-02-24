% NA_MODEL
%
%   Zadaju sa parametre  prenosu regulovaneho modelu
%
%   SPUSTA - TESTMODEL pre vseobecny prenos alebo
%          - TESTMODEL2 pre Strejcov prenos
%          - TESTMODEL3 pre Tlmene kmitavy system

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


Qcit=cit;
Qmen=men;
QD=D;
Qcas_simulacie =cas_simulacie;

naspat = 'na_model';

% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,4);

figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'name',ptg_string(1,5,ptv_str_lang), ...
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
          'CallBack','typ_id = get(typid,''Value'');if(typ_id)==1,na_model2,elseif(typ_id)==2,na_model3,elseif(typ_id)==3,na_model4,end;');

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

Qcas_simulacie =  uicontrol(gcf,...
  'Style','edit',...
  'ForegroundColor','black',...
  'Fontsize',[12],...
  'BackgroundColor',[1 1 1],... 	
  'Fontsize',[12],...
  'String', num2str(Qcas_simulacie),...
  'Position',[140 55 120 25],...
  'CallBack',['ic(1,4)=1;Qcas_simulacie=str2num(get(gco,''String''));']);
      
%----SPAT-----%

navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 10 60 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','close,vyb_ident');


ident = uicontrol(gcf,...
          'Style','push',...
          'Position',[145 10 120 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,4,ptv_str_lang),...
          'ForegroundColor','red',...
          'CallBack','close,if(typ_id)==1,typ_i=typ_i+1;testmodel,elseif(typ_id)==2,testmodel2,elseif(typ_id)==3,testmodel3,,end;');

if(typ_id)==1       % Vseobecny tvar
    na_model2
elseif(typ_id)==2   % Strejcov tvar
    typ_i = 1;
    na_model3
elseif(typ_id)==3   % Kmitavy tvar
    typ_i = 2;
    na_model4    
end