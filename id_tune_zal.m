

function id_tune(input,t,y_norm,t_id,y_id)

global tang ptv_str_lang

if(input == 's0' )
    
    point1_X = min(tang(:,1));
    point1_Y = min(tang(:,2));
    point2_X = max(tang(:,1));
    point2_Y = max(tang(:,2));

    figure
    set(gcf,'Tag','id_tune')
    set(gcf,'Color','white')
    
    plot(t,y_norm,tang(:,1),tang(:,2),t_id,y_id)
    axis([t(1) t(end) min(y_norm)*1.05 max(y_norm)*1.05])
    
    s1 = uicontrol('Tag','s1',...
        'Units','Normalized',...
        'Position',[0.1 0.005 0.84 0.05],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Value',tang(1,1),...
        'Sliderstep',[t(2)-t(1),(t(2)-t(1))*10],...
        'CallBack','id_tune(''s1'',t,y_norm,t_id,y_id)');

    s2 = uicontrol('Tag','s2',...
        'Units','Normalized',...
        'Position',[0.1 0.94 0.84 0.05],...
        'Style','Slider',...
        'Min',t(1),'Max',t(end),...
        'Value',tang(2,1),...
        'Sliderstep',[t(2)-t(1),(t(2)-t(1))*10],...
        'CallBack','id_tune(''s2'',t,y_norm,t_id,y_id)');
    
    b1 = uicontrol('Style','push',...
        'Units','Normalized',...
        'Position',[0.02 0.5 0.06 0.06],...
        'Fontweight','bold',...
        'String',ptg_string(3,1,ptv_str_lang),...
        'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),naspat=''id_param'';global n K T D Tu Tn;[K,M] = get_tf(1,n,K,T);sim_ident;typ_i2 = 1;id_param');
    
else
    
    if(input == 's1')
        
        global tang n K T D Tu Tn
        tang(1,1) = get(findobj('Tag','s1'),'Value');
        
        [n,K,T,D,Tu,Tn] = ptf_strejc(0,1,y_norm(1),y_norm(end),t(1),t(1),tang(1,1),tang(2,1));
        
    elseif(input == 's2')
        
        global tang n K T D Tu Tn
        tang(2,1) = get(findobj('Tag','s2'),'Value');
        
        [n,K,T,D,Tu,Tn] = ptf_strejc(0,1,y_norm(1),y_norm(end),t(1),t(1),tang(1,1),tang(2,1));
            
    end
    
    K = y_norm(end);
    [num,den] = get_tf(1,n,K,T);
    
    sys = tf(conv(num,[-D, 2]),conv(den,[D, 2]));
    [y_id,t_id] = step(sys);
    y_id = [y_id;y_norm(end)];
    t_id = [t_id;t(end)];
    
    figure(gcf)
    plot(t,y_norm,tang(:,1),tang(:,2),t_id,y_id);
    axis([t(1) t(end) min(y_norm)*1.05 max(y_norm)*1.05])
    
end