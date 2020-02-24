% POROVNAT2
% Vykreslenie simulacie Strejcovou metodou pre identifikovany a povodny prenos
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


sim('compTF')

t_id=id_data3(:,1);
y_1=id_data3(:,2);
y_2=id_data3(:,3);

% Spracovanie odchylky
%
pth_fig = findobj('Tag','ptt_id_param');

if(isempty(pth_fig)~=1);
    
    pth_fig = pth_fig(1);

    % Vypocet chyby identifikacie: Integral(Y(povodna)-Y(identifikovana))^2 dt / Integral(Y(povodna)^2) dt
    %
    odchylka = ptf_square_error(y_1,y_2);

    odchylka_text = uicontrol(pth_fig,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',fgcolor,... 	
          'Position',[20 155 250 25],...
          'String',ptg_string(2,10,ptv_str_lang));
       odchylka_text = uicontrol(pth_fig,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',ptf_semaph(abs(odchylka),1, 0.001, 0.005,ptv_cfbcg),... 	
          'Position',[20 130 250 25],...
          'String',num2str(odchylka) ,...
          'CallBack','set(gco,''String'',num2str(odchylka))');
end
%
% Koniec - Spracovanie odchylky


% Graficky priebeh
%
figure('position',[580 60 560 420],'Color','white'); 

Qch1=uicontrol(gcf,'Tag','ptt_ch1',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_uL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch1''),ptf_checkval(''ptt_ch2''),{[t_id,y_1],[t_id,y_2],{''blue'',''red''}},[19,3,4],[17,20],ptv_str_lang)');

Qch2=uicontrol(gcf,'Tag','ptt_ch2',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_uG,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch1''),ptf_checkval(''ptt_ch2''),{[t_id,y_1],[t_id,y_2],{''blue'',''red''}},[19,3,4],[17,20],ptv_str_lang)');

ptg_plot_check(ptf_checkval('ptt_ch1'),ptf_checkval('ptt_ch2'),{[t_id,y_1],[t_id,y_2],{'blue','red'}},[19,3,4],[17,20],ptv_str_lang);

param_vl2