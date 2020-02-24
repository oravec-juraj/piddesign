
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

cas_simulacie=t(end);

% Ak prebehlo ladenie
%
if(exist('y_backup') == 1)
    yn = y_backup;
end


% Ulozenie povodneho kroku simulacie do pamate
%
ptv_sim_step_temp = ptv_sim_step;
%
% Vypocet noveho kroku simulacie na zaklade nacitaneho datoveho suboru
% Predpoklada sa fixny krok casu v datovom subore
%
ptv_sim_step = t(2)-t(1);
if(ptv_sim_step == 0)   % possible in case of variable step size
    ptv_sim_step = (t(end)-t(1))/size(t,1);
end
%
% Simulacia
%
t = chk_timespan(t);
try 
    sim('compSR2',t)
catch
    % Come Step Responses of very noised signals may have troouble to be
    % simulated, hence we need auxiliarly fake data
    id_data4 = [t, zeros(length(t),1)];
end % try    
%
% Nacitanie povodneho kroku simulacie z pamate
%
ptv_sim_step = ptv_sim_step_temp;

t_id = id_data4(:,1);

% BugFix for Variable Simulation step to prevent Fatal Error
% R20150513
if(length(t_id) > length(yn))
    t_id = t_id(1:length(yn));
end % if
    
y_1 = yn(1:length(t_id)); % Povodna PH
y_2 = id_data4(1:length(y_1),2); % Identifikovana PCH

% Pre moznost ladenia
%
t = t_id;
yn = y_2;


odchylka = ptf_ident_error(y_1,y_2);


figure('position',[510 80 560 420],'Tag','ptt_plot','Color','white');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t_id,y_1],[[Tu;Tu+Tn],[0;K]],{''blue'',''red''}},[14,3,4],[17,-1],ptv_str_lang)');

Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t_id,y_1],[[Tu;Tu+Tn],[0;K]],{''blue'',''red''}},[14,3,4],[17,-1],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[t_id,y_1],[[Tu;Tu+Tn],[0;K]],{'blue','red'}},[14,3,4],[17,-1],ptv_str_lang)


figure('position',[10 60 560 420],'Tag','ptt_plot','Color','white');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t_id,y_1],[t_id,y_2],{''red'',''blue''}},[14,3,4],[17,14],ptv_str_lang)');

Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t_id,y_1],[t_id,y_2],{''red'',''blue''}},[14,3,4],[17,14],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[t_id,y_1],[t_id,y_2],{'red','blue'}},[14,3,4],[17,14],ptv_str_lang)