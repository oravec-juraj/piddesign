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


function id_tune(input,t,y_norm,t_id,y_id,id_backup)

global tang D_t K_t ptv_str_lang

% D_t = id_backup(4); % ZZZ
if (isempty(D_t) == 1)
    D_t = 0;
end %if

if(input == 's0' )
    
    % Close yet opened ID_TUNE figures
    %
    close(findobj('Tag','ptt_id_tune'))
    close(findobj('Tag','ptt_id_tune2'))
    
    if (y_norm(end) < 0)
    
        tang_temp = tang(1,:);
        tang(1,:) = tang(2,:);
        tang(2,:) = tang_temp;
        
    end
    
    hf1 = figure;
    
    size_fig = get(hf1,'Position');
    size_fig(3) = size_fig(3) + 250;
    set(hf1,'Position',size_fig);
    set(hf1,'Tag','ptt_id_tune');
    set(hf1,'Color','white');
    
    plot(t,y_norm,tang(:,1),tang(:,2),t_id,y_id)
    axis([t(1) t(end) min(y_norm)*1.05 max(y_norm)*1.05])
    
    Tu = id_backup(5)-id_backup(4); % Tu - D
    Tn = id_backup(6); % Tn
    sliderstep = (Tn-Tu)/1000;
    
    s1 = uicontrol('Tag','ptt_s1',...
        'Units','Normalized',...
        'Position',[0.11 0.035 0.82 0.03],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Value',tang(1,1),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune(''s1'',t,y_norm,t_id,y_id,id_backup)');

    s2 = uicontrol('Tag','ptt_s2',...
        'Units','Normalized',...
        'Position',[0.11 0.94 0.82 0.05],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Value',tang(2,1),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune(''s2'',t,y_norm,t_id,y_id,id_backup)');

    % TIME DELAY
    %
    s3 = uicontrol('Tag','ptt_s3',...
        'Units','Normalized',...
        'Position',[0.11 0.005 0.82 0.03],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune(''s3'',t,y_norm,t_id,y_id,id_backup)');
        set(findobj('Tag','ptt_s3'),'Value',D_t)

	% GAIN K
    %
    ax = axis;
    K_t = y_norm(end);
	s4 = uicontrol('Tag','ptt_s4',...
        'Units','Normalized',...
        'Position',[0.94 0.07 0.03 0.9],...
        'Style','Slider',...
        'Min',min([ax(3),ax(4)]),'Max',max([ax(3),ax(4)]),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune(''s4'',t,y_norm,t_id,y_id,id_backup)');
        set(findobj('Tag','ptt_s4'),'Value',y_norm(end));
        
    % OK
    %
    b1 = uicontrol('Style','push',...
        'Units','Normalized',...
        'Position',[0.02 0.5 0.06 0.06],...
        'Fontweight','bold',...
        'String',ptg_string(3,1,ptv_str_lang),...
        'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),close(findobj(''Tag'',''ptt_id_tune2'')),naspat=''id_param'';global n K T D Tu Tn;[K,M] = get_tf(1,n,K,T);sim_ident;typ_i2 = 1;id_param');

    % BACK
    %
    b2 = uicontrol('Style','push',...
        'Units','Normalized',...
        'Position',[0.02 0.4 0.06 0.06],...
        'String',ptg_string(3,2,ptv_str_lang),...
        'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),close(findobj(''Tag'',''ptt_id_tune2'')),n=id_backup(1);K=id_backup(2);T=id_backup(3);D=id_backup(4);Tu=id_backup(5);Tn=id_backup(6);sim_ident;typ_i2 = 1;id_param');
    
    % PREC+
    %
    b3 = uicontrol('Style','push',...
        'Units','Normalized',...
        'Position',[0.02 0.3 0.06 0.06],...
        'String',ptg_string(3,25,ptv_str_lang),...
        'CallBack','slider_step = get(findobj(''Tag'',''ptt_s1''),''Sliderstep'');slider_step=slider_step/10;set(findobj(''Tag'',''ptt_s1''),''Sliderstep'',slider_step),set(findobj(''Tag'',''ptt_s2''),''Sliderstep'',slider_step);set(findobj(''Tag'',''ptt_s3''),''Sliderstep'',slider_step);set(findobj(''Tag'',''ptt_s4''),''Sliderstep'',slider_step);');
   
    t1 = uicontrol('Style','text',...
            'Tag','ptt_t1',...
            'Position',[0 0 50 18],...
            'String',tang(1,1),...
            'BackgroundColor',get(gcf,'Color'));

    t2 = uicontrol('Style','text',...
            'Tag','ptt_t2',...
            'Position',[0 size_fig(4)-25 50 18],...
            'String',tang(2,1),...
            'BackgroundColor',get(gcf,'Color'));

    % FIGURE 2 - square error evaluation
    %
    hf2 = figure;
    set(hf2,'Tag','ptt_id_tune2')
    set(hf2,'Position',[size_fig(1) size_fig(2)-size_fig(4)/2-80 size_fig(3) size_fig(4)/2]);
    set(gcf,'Color','white')
    xlabel(ptg_string(10,3,ptv_str_lang))
    ylabel(ptg_string(10,19,ptv_str_lang))
    %
    bar(t,(y_norm - y_id),'r');
    xlabel(ptg_string(10,3,ptv_str_lang))
    ylabel(ptg_string(10,19,ptv_str_lang))
    axis([t(1) t(end) min((y_norm - y_id))*1.05-1e-8 max((y_norm - y_id))*1.05+1e-8])
    
    % Square Error
    %
    % Initial value of square error SE
    %
    se = (y_norm - y_id)'*(y_norm - y_id)/(sum(y_norm.^2));
    %
    t3 = uicontrol('Style','text',...
            'Tag','ptt_t3',...
            'Units','Normalized',...
            'Position',[0.75 0.8 0.15 0.08],...
            'String',num2str(se),...
            'BackgroundColor',get(gcf,'Color'));
    % Set value of square error
    %
    set(findobj('Tag','ptt_t3'),'String',num2str(se));

else
    
    if(input == 's1')
        
        global tang n K T D Tu Tn
        
        % if(get(findobj('Tag','ptt_s1'),'Value') > tang(2,1))&(y_norm(end) > 0) | (get(findobj('Tag','ptt_s1'),'Value') < tang(2,1))&(y_norm(end) < 0)
        s1 = get(findobj('Tag','ptt_s1'),'Value');
        s2 = get(findobj('Tag','ptt_s2'),'Value');
        D_tmp = get(findobj('Tag','ptt_s3'),'Value');
      
        if(K_t > 0)&( (s1 < D_tmp)| (s1 >= s2) )
            
            disp('tu som')
            % set(findobj('Tag','ptt_s1'),'Value',tang(1,1));
            set(findobj('Tag','ptt_s1'),'Value',tang(2,1));
            
        else
        
        tang(1,1) = get(findobj('Tag','ptt_s1'),'Value');
        set(findobj('Tag','ptt_t1'),'String',tang(1,1));
        
        end
        
    elseif(input == 's2')
        
        global tang n K T D Tu Tn
        
        % if(get(findobj('Tag','ptt_s2'),'Value') < tang(1,1))&(y_norm(end) > 0) | (get(findobj('Tag','ptt_s2'),'Value') > tang(1,1))&(y_norm(end) < 0)
        
        s1 = get(findobj('Tag','ptt_s1'),'Value');
        s2 = get(findobj('Tag','ptt_s2'),'Value');
        D_tmp = get(findobj('Tag','ptt_s3'),'Value');

        if (s2 < D_tmp) | ( (K_t > 0)&(s2 <= s1) ) | ( (K_t < 0)&(s1 <= s2) )
            
            % set(findobj('Tag','ptt_s2'),'Value',tang(2,1));
            set(findobj('Tag','ptt_s2'),'Value',tang(1,1));
            
        else
            
            tang(2,1) = get(findobj('Tag','ptt_s2'),'Value');
            set(findobj('Tag','ptt_t2'),'String',tang(2,1));
            
        end
        
    elseif(input == 's3')
        
        global tang n K T D Tu Tn D_t
        
        s1 = get(findobj('Tag','ptt_s1'),'Value');
        s2 = get(findobj('Tag','ptt_s2'),'Value');
        D_tmp = get(findobj('Tag','ptt_s3'),'Value');
        if(D_tmp > min(s1,s2))
            set(findobj('Tag','ptt_s3'),'Value',D_t);
        else
            D_t = D_tmp;
        end

    elseif(input == 's4')
        
        K_t = get(findobj('Tag','ptt_s4'),'Value');
        

    end

        % Shift Tangent to Time-Delay
        tang(1,1) = tang(1,1) - D_t;
        tang(2,1) = tang(2,1) - D_t;
        
        % [n,K,T,D,Tu,Tn] = ptf_strejc(0,1,y_norm(1),y_norm(end),t(1),t(1),min(tang(:,1)),max(tang(:,1)));
        try
            [n,K,T,D,Tu,Tn] = ptf_strejc(0,1,y_norm(1),y_norm(end),t(1),D_t,D_t+min(tang(:,1)),D_t+max(tang(:,1)));
            % n = 1; K = y_norm(end); T = max(tang(:,1)); D = min(tang(:,1)); Tu = D; Tn = T;
        catch
            n = 1;
            K = 1;
            T = 1;
            D = 0.1;
            Tu = D;
            Tn = T;
            disp('WARNING:ID_TUNE:UNEXPECTED ERROR OCCURED!')
        end %
        
        % Update D using Slider-Value S3
%         D = D + D_t; % ZZZ
        
        % Update Gain K using Slider-Value S4
        K = K_t;
        
        [num,den] = get_tf(1,n,K,T);
    
        K = get(findobj('Tag','ptt_s4'),'Value');
        sys = tf(K,den,'ioDelay',D);
        
        [y_id,t_id] = step(sys,t);
        y_id = [y_id];
        t_id = t;

        % Odoslanie identifikovanych udajov do okna PROCESS MODEL
        %
        if (isempty(findobj('Tag','ppt_id_param')) ~= 0)
        
            set(findobj('Tag','ptt_n'),'String',num2str(n));
            set(findobj('Tag','ptt_K'),'String',num2str(K));
            set(findobj('Tag','ptt_T'),'String',num2str(T));
            set(findobj('Tag','ptt_D'),'String',num2str(D));
        
        end
    
        figure(gcf)
        
        % Return Tangent to Time-Delay
        tang(1,1) = tang(1,1) + D_t;
        tang(2,1) = tang(2,1) + D_t;
        
        plot(t,y_norm,tang(:,1),tang(:,2),t_id,y_id)
        axis([t(1) t(end) min(y_norm)*1.05 max(y_norm)*1.05])
        
        % SQARE ERROR
        %
        hf2 = findobj('Tag','ptt_id_tune2');
        
        if(isempty(hf2) ~= 1)

            % Square error calcualtion
            %
            se_old = get(findobj('Tag','ptt_t3'),'String');
            se_old = str2num(se_old);
            
            se = (y_norm - y_id)'*(y_norm - y_id)/(sum(y_norm.^2));

            % Backgroundcolor of square error
            %
            if(se > se_old)
                set(findobj('Tag','ptt_t3'),'BackgroundColor','red');
            elseif(se < se_old)
                set(findobj('Tag','ptt_t3'),'BackgroundColor','green');
            else
                set(findobj('Tag','ptt_t3'),'BackgroundColor',get(gcf,'Color'));
            end
        
            % Set value of square error
            %
            set(findobj('Tag','ptt_t3'),'String',num2str(se));
        
            % Figure PTT_ID_TUNE2
            %
            figure(hf2)
            box on
            bar(t,(y_norm - y_id),'r');
            xlabel(ptg_string(10,3,ptv_str_lang))
            ylabel(ptg_string(10,19,ptv_str_lang))
            axis([t(1) t(end) min((y_norm - y_id))*1.05 max((y_norm - y_id))*1.05])
            
        end
        
    end
    
end