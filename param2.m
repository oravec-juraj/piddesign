% PARAM2
%
%   Identifikacia prenosu vysieho radu
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


[n,K,T,D,Tu,Tn] = ptf_strejc(u_0,u_nek,y_0,y_nek,t0,t_D,t1,t2);


% Aby identifikacia s nizsim radom - NIZSIEN vedela, aky je maximalny povoleny rad
n_max = n;

if(exist ('odchylka'))
    clear('odchylka')
end

% Graficky priebeh
%
[K,M] = get_tf(1,n,K,T);
naspat='close,sustavy';

sim('generujpch')
figure('position',[10 60 560 420],'Tag','ptt_plot','Color','white');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[pch(:,1),pch(:,2)],[[t1-t0;t2-t0],[0;K]],{''blue'',''red''}},[14,3,4],[4,-1],ptv_str_lang)');
Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[pch(:,1),pch(:,2)],[[t1-t0;t2-t0],[0;K]],{''blue'',''red''}},[14,3,4],[4,-1],ptv_str_lang)');
ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[pch(:,1),pch(:,2)],[[t1-t0;t2-t0],[0;K]],{'blue','red'}},[14,3,4],[4,-1],ptv_str_lang)

% Pre moznost ladenia
%
t = pch(:,1);
yn = pch(:,2);
y_1 = yn;

% Identifikovany system je aperiodicky
%
typ_i2 = 1;

id_param
