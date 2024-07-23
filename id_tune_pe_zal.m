


% XXX
% y_norm=y;
% t_id=t;
% y_id=y;
% flag = 's0';
% 

function id_tune_pe(flag,t,y_norm,t_id,y_id)

global ptv_str_lang

if(flag == 's0' )
    
    % Close yet opened ID_TUNE figures
    %
    close(findobj('Tag','ptt_id_tune'))
    close(findobj('Tag','ptt_id_tune2'))
    
    if (y_norm(end) < 0)

% XXX
%         tang_temp = tang(1,:);
%         tang(1,:) = tang(2,:);
%         tang(2,:) = tang_temp;
        
    end
    
    hf1 = figure;
    
    size_fig = get(hf1,'Position');
    size_fig(3) = size_fig(3) + 250;
    set(hf1,'Position',size_fig);
    set(hf1,'Tag','ptt_id_tune')
    set(hf1,'Color','white')
    
    plot(t,y_norm,t_id,y_id)
    axis([t(1) t(end) min(y_norm)*1.05 max(y_norm)*1.05])

    % OK
    %
    b1 = uicontrol('Style','push',...
        'Units','Normalized',...
        'Position',[0.02 0.5 0.06 0.06],...
        'Fontweight','bold',...
        'String',ptg_string(3,1,ptv_str_lang),...
        'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),close(findobj(''Tag'',''ptt_id_tune2'')),naspat=''id_param'';global n K T D Tu Tn;[K,M] = get_tf(1,n,K,T);sim_ident;typ_i2 = 1;id_param');
    set(b1,'Tag','ptt_data_pe')
    
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
        'CallBack','slider_step = get(findobj(''Tag'',''ptt_s1''),''Sliderstep'');slider_step=slider_step/10;set(findobj(''Tag'',''ptt_s1''),''Sliderstep'',slider_step),set(findobj(''Tag'',''ptt_s2''),''Sliderstep'',slider_step);');
   
% Initial Values of the structure DATA_PE
%
[y_max, y_min, t_max, t_min, t_D] = ptf_min_max_data_pe(t,y_norm);
data_pe.y_max = y_max;
data_pe.y_min = y_min;
data_pe.t_max = t_max;
data_pe.t_min = t_min;
data_pe.t_D = t_D;
set(findobj('Tag','ptt_data_pe'),'userdata')

sliderstep = 0.005;
ax = axis;
    
    % Y_MAX
    %
    s1 = uicontrol('Tag','ptt_s1',...
        'Units','Normalized',...
        'Position',[0.92 0.07 0.03 0.9],...
        'Style','Slider',...
        'Min',min([ax(3),ax(4)]),'Max',data_pe.y_max*1.2,...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune_pe(''s1'',t,y_norm,t_id,y_id)');
        set(findobj('Tag','ptt_s1'),'Value',data_pe.y_max)
    
    % Y_MIN
    %
    s2 = uicontrol('Tag','ptt_s2',...
        'Units','Normalized',...
        'Position',[0.96 0.07 0.03 0.9],...
        'Style','Slider',...
        'Min',min([ax(3),ax(4)]),'Max',data_pe.y_max*1.2,...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune_pe(''s2'',t,y_norm,t_id,y_id)');
        set(findobj('Tag','ptt_s2'),'Value',data_pe.y_min)

    % T_MAX
    %
    s3 = uicontrol('Tag','ptt_s3',...
        'Units','Normalized',...
        'Position',[0.11 0.005 0.82 0.03],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune_pe(''s3'',t,y_norm,t_id,y_id)');
        set(findobj('Tag','ptt_s3'),'Value',data_pe.t_max)

    % T_MIN
    %
    s4 = uicontrol('Tag','ptt_s4',...
        'Units','Normalized',...
        'Position',[0.11 0.035 0.82 0.03],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune_pe(''s4'',t,y_norm,t_id,y_id)');
        set(findobj('Tag','ptt_s4'),'Value',data_pe.t_min)

    % TIME DELAY
    %
    s5 = uicontrol('Tag','ptt_s5',...
        'Units','Normalized',...
        'Position',[0.11 0.94 0.82 0.05],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Sliderstep',[sliderstep, sliderstep*10],...
        'CallBack','id_tune_pe(''s5'',t,y_norm,t_id,y_id)');
        set(findobj('Tag','ptt_s5'),'Value',data_pe.t_D)

    t1 = uicontrol('Style','text',...
            'Tag','ptt_t1',...
            'Position',[0 size_fig(4)-25 50 18],...
            'String',data_pe.y_max,...
            'BackgroundColor',get(gcf,'Color'));

    t1_y = uicontrol('Style','text',...
            'Tag','ptt_t1_y',...
            'Position',[0 size_fig(4)-55 50 18],...
            'String',data_pe.y_max,...
            'BackgroundColor',get(gcf,'Color'));
        
    t2 = uicontrol('Style','text',...
            'Tag','ptt_t2',...
            'Position',[0 30 50 18],...
            'String',data_pe.y_max,...
            'BackgroundColor',get(gcf,'Color'));
    
    t2_y = uicontrol('Style','text',...
            'Tag','ptt_t2_y',...
            'Position',[0 0 50 18],...
            'String',data_pe.y_max,...
            'BackgroundColor',get(gcf,'Color'));

    % FIGURE 2 - square error evaluation
    %
    hf2 = figure;
    set(hf2,'Tag','ptt_id_tune2')
    set(hf2,'Position',[size_fig(1) size_fig(2)-size_fig(4)/2-55 size_fig(3) size_fig(4)/2]);
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
    
    if(flag == 's1')
        %
        data_pe = get(findobj('Tag','ptt_data_pe'),'userdata');
        %
        % Load New Values
        %
        y_max = get(findobj('Tag','ptt_s1'),'Value');
        y_min = get(findobj('Tag','ptt_s2'),'Value');
        %
        % Chek New Values
        %
        if(y_min < y_max)
            %
            % Set New Valid Values
            %
            data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
            data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
            data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
            data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
            data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');
            set(findobj('Tag','ptt_data_pe'),'userdata',data_pe);
        else
            %
            % Set Last Valid Values
            %
            set(findobj('Tag','ptt_s1'),'Value',data_pe.y_max);
            set(findobj('Tag','ptt_s2'),'Value',data_pe.y_min);
        end
        
    elseif(flag == 's2')
        %
        data_pe = get(findobj('Tag','ptt_data_pe'),'userdata');
        %
        % Load New Values
        %
        y_max = get(findobj('Tag','ptt_s1'),'Value');
        y_min = get(findobj('Tag','ptt_s2'),'Value');
        %
        % Chek New Values
        %
        if(y_min < y_max)
            %
            % Set New Valid Values
            %
            data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
            data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
            data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
            data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
            data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');
            set(findobj('Tag','ptt_data_pe'),'userdata',data_pe);
        else
            %
            % Set Last Valid Values
            %
            set(findobj('Tag','ptt_s1'),'Value',data_pe.y_max);
            set(findobj('Tag','ptt_s2'),'Value',data_pe.y_min);
        end
    
    elseif(flag == 's3')
        %
        data_pe = get(findobj('Tag','ptt_data_pe'),'userdata');
        %
        % Load New Values
        %
        t_max = get(findobj('Tag','ptt_s3'),'Value');
        t_min = get(findobj('Tag','ptt_s4'),'Value');
        t_D = get(findobj('Tag','ptt_s5'),'Value');
        %
        % Chek New Values
        %
        if(t_D < t_max) & (t_max < t_min)
            %
            % Set New Valid Values
            %
            data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
            data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
            data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');
            data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
            data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
            set(findobj('Tag','ptt_data_pe'),'userdata',data_pe);
        else
            %
            % Set Last Valid Values
            %
            set(findobj('Tag','ptt_s3'),'Value',data_pe.t_max);    
            set(findobj('Tag','ptt_s4'),'Value',data_pe.t_min);
            set(findobj('Tag','ptt_s5'),'Value',data_pe.t_D);
        end
        
    elseif(flag == 's4')
        %
        data_pe = get(findobj('Tag','ptt_data_pe'),'userdata');
        %
        % Load New Values
        %
        t_max = get(findobj('Tag','ptt_s3'),'Value');
        t_min = get(findobj('Tag','ptt_s4'),'Value');
        t_D = get(findobj('Tag','ptt_s5'),'Value');
        %
        % Chek New Values
        %
        if(t_D < t_max) & (t_max < t_min)
            %
            % Set New Valid Values
            %
            data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
            data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
            data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
            data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
            data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');
            set(findobj('Tag','ptt_data_pe'),'userdata',data_pe);
        else
            %
            % Set Last Valid Values
            %
            set(findobj('Tag','ptt_s3'),'Value',data_pe.t_max);    
            set(findobj('Tag','ptt_s4'),'Value',data_pe.t_min);
            set(findobj('Tag','ptt_s5'),'Value',data_pe.t_D);
        end
            
    elseif(flag == 's5')
        %
        data_pe = get(findobj('Tag','ptt_data_pe'),'userdata');
        %
        % Load New Values
        %
        t_max = get(findobj('Tag','ptt_s3'),'Value')
        t_min = get(findobj('Tag','ptt_s4'),'Value')
        t_D = get(findobj('Tag','ptt_s5'),'Value')
        %
        % Chek New Values
        %
        if(t_D < t_max) & (t_max < t_min)
            %
            % Set New Valid Values
            %
            data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
            data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
            data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
            data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
            data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');
            set(findobj('Tag','ptt_data_pe'),'userdata',data_pe);
        else
            %
            % Set Last Valid Values
            %
            set(findobj('Tag','ptt_s3'),'Value',data_pe.t_max);
            set(findobj('Tag','ptt_s4'),'Value',data_pe.t_min);
            set(findobj('Tag','ptt_s5'),'Value',data_pe.t_D);
        end
        
    end

data_pe.y_max = get(findobj('Tag','ptt_s1'),'Value');
data_pe.y_min = get(findobj('Tag','ptt_s2'),'Value');
data_pe.t_max = get(findobj('Tag','ptt_s3'),'Value');
data_pe.t_min = get(findobj('Tag','ptt_s4'),'Value');
data_pe.t_D = get(findobj('Tag','ptt_s5'),'Value');

% Set Text
%
set(findobj('Tag','ptt_t1'),'String',get(findobj('Tag','ptt_s3'),'Value'));
set(findobj('Tag','ptt_t1_y'),'String',get(findobj('Tag','ptt_s1'),'Value'));
set(findobj('Tag','ptt_t2'),'String',get(findobj('Tag','ptt_s4'),'Value'));
set(findobj('Tag','ptt_t2_y'),'String',get(findobj('Tag','ptt_s2'),'Value'));

% [K,T_km,ksi_km,D_km] = km_sustavy(t0,t_D,t1,t2,y_0,y_max,y_min,y_nek,u_0,u_nek,cas_simulacie)
[K,T_km,ksi_km,D_km] = km_sustavy(t(1),data_pe.t_D,data_pe.t_max,data_pe.t_min,y_norm(1),data_pe.y_max,data_pe.y_min,y_norm(end),0,1,t(end))
        [num,den] = get_tf(2,ksi_km,K,T_km);

        sys = tf(num,den,'ioDelay',D_km);
        
        [y_id,t_id] = step(sys,t);
        y_id = [y_id];
        t_id = t;

        % Odoslanie identifikovanych udajov do okna PROCESS MODEL
        %
% XXX
%         if (isempty(findobj('Tag','ppt_id_param')) ~= 0)
%         
%             set(findobj('Tag','ptt_n'),'String',num2str(n));
%             set(findobj('Tag','ptt_K'),'String',num2str(K));
%             set(findobj('Tag','ptt_T'),'String',num2str(T));
%             set(findobj('Tag','ptt_D'),'String',num2str(D));
%         
%         end
    
        figure(gcf)
% XXX
% plot(t,y_norm,[t(1);t(end)],[bound_pe(1);bound_pe(1)]/10,'-.',[t(1);t(end)],[bound_pe(2);bound_pe(2)]/10,':',t_id,y_id);
plot(t,y_norm,t_id,y_id);

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
            bar(t,(y_norm - y_id),'r');
            xlabel(ptg_string(10,3,ptv_str_lang))
            ylabel(ptg_string(10,19,ptv_str_lang))
            axis([t(1) t(end) min((y_norm - y_id))*1.05 max((y_norm - y_id))*1.05])
            
        end
        
    end
    
end