% PARAM_VL2
%
%   Sluzi na zadanie parametrov pre metody syntezy regulatora
%
%   Dava na vyber:
%
%   SYNTEZA REGULATORA - TEST_V

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


% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,4);

    % Premenna J1, ktora urcuje, ci uz bola spustena synteza regulatora alebo
    % test kvality. Ak ano, J1 == 1, inak J1 == 0
    J1 = 1;

close(findobj('Tag','ptt_param'))

if(exist('typ_i2'))
    typ_i = typ_i2;
elseif (isnumeric(ksi_km)&&isnumeric(K)&&isnumeric(T_km)&&isnumeric(D_km))
    typ_i = 2;
else
    typ_i = 1;
end

    figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Tag','ptt_param',...
          'Menubar',ptv_fig_menubar,...
          'name',ptg_string(1,5,ptv_str_lang),...
          'position',[150 100 260 270]);

% Clolourful effect
ptf_cfbcg(gcf,ptv_cfbcg)


%--------------- Vyber typu prenosu ----------------------
typid = uicontrol(gcf,...
          'Style','popup',...
          'Position',[20 220 220 35],...
          'String',ptg_string(4,1,ptv_str_lang),...
          'Value',typ_i,...
          'Tag','ptt_typ_i',...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typ_i = get(gco,''Value'');if(typ_i)==1,param_vl3,elseif(typ_i)==2,param_vl4,end;');

%-----TLACITKO-----%

pth_but = uicontrol(gcf,...
          'Style','push',...
          'Position',[90 20 155 25],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,3,ptv_str_lang),...
          'ForegroundColor','black',...
          'CallBack','typ_i = get(findobj(''Tag'',''ptt_typ_i''),''Value'');close(gcf),close(findobj(''Tag'',''ptt_id_param'')),close(findobj(''Tag'',''ptt_id_tune'')),close(findobj(''Tag'',''ptt_plot'')),J1 = 0; if(typ_i==1),test_v,else,test_v2,end');

if(typ_i)==1       % Strejcov tvar
    param_vl3
elseif(typ_i)==2   % Kmitavy tvar
    param_vl4    
end