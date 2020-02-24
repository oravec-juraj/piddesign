% PARAM_KM
%
%   Volane z - TESTID, TESTMODEL
%
%   Spusta - ID_PARAM

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


% premenna NASPAT urcuje, ze kam sa vrati z tlacitka SPAT po zavreti CLOSE
% VYB_FIL, FILTRACIA, SUS

% Kontrola, ci prebehla spravne identifikacia => ak ano, premenna OK ==1
% OK == 0 ak sa kmitavo identifikuje aperiodicky system

if(OK==0)
     pth_fig = ptg_error(naspat,ptg_string(9,24,ptv_str_lang),ptv_str_lang);
else
      
[K,M] = get_tf(2,ksi_km,K,T_km);
D = D_km;

% Simulacia
%
if (exist('tn') == 1)       % tn - normalized time, generated in OBR_NORMALIZACIE
    sim('generujpch',tn)
else
    sim('generujpch')       % in case, OBR_NORMALIZACIE was not used, e.g.: IDENTIFIKACIA/PROCESS MODEL DATA/
    tn = pch(:,1);
end
%

if(naspat(end)~='s') % Ak neboli tieto parametre volane zo - SUS, tak vykresli porovnanie

    % Vypocet odchylky identifikacie
    %
    odchylka = ptf_square_error(yn,pch(:,2));
    iQ=1;
    
    % Porovnanie PCH pri identifikacii z datoveho suboru
    %
    figure('position',[10 60 560 420],'Tag','ptt_plot','Color','white');

   Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[tn,yn],[pch(:,1),pch(:,2)],{''red'',''blue''}},[14,3,4],[17 14],ptv_str_lang)');

   Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[tn,yn],[pch(:,1),pch(:,2)],{''red'',''blue''}},[14,3,4],[17 14],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[tn,yn],[pch(:,1),pch(:,2)],{'red','blue'}},[14,3,4],[17 14],ptv_str_lang)


else    % Vykreslenie PCH pri identifikacii z vlastnych parametrov 

figure('position',[10 60 560 420],'Tag','ptt_plot','Color','white');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[pch(:,1),pch(:,2)],{''blue''}},[14,3,4],[4],ptv_str_lang)');

Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[pch(:,1),pch(:,2)],{''blue''}},[14,3,4],[4],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[pch(:,1),pch(:,2)],{'blue'}},[14,3,4],[4],ptv_str_lang)

end

% Identifikovany system je tlmene kmitavy
%
typ_i2 = 2;

% Kvoli identification tunning - id_tune_pe.m
%
% y_norm_plot = pch(:,2);
% yn = pch(:,2);
t = tn;
if (exist('ynew')==1)
    y_norm_plot = ynew(:,1);
else
    y_norm_plot = pch(:,2);
yn = pch(:,2);
end


id_param

end