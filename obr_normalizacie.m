% OBR_NORMALIZACIE
%
%   Vykreslenie normalizovanej PCH



%data=load(datasub)

if(size(data,2) == 2)
    
    % Normalizacia dat typu t-y
    %
    t = data((find(data(:,1)==t0)):end,1);

    if(t(1)~=0)
        t=t-t0; 
    end

    y = data((find(data(:,1)==t0)):end,2);
    cas_simulacie = t(end);

    y_0=y(1);

    ynew=(y-y_0)/delta_u;
    yn = ynew;

    y_norm_plot = yn;
    
    add_leg = '';

else
    
    % Normalizacia dat typu t-y-u
    %
    [y_norm, t, y_nom] = get_ynorm(data(:,1),data(:,2),data(:,3));
    y_norm_plot = [y_nom,y_norm];
    yn = y_nom;
    ynew = yn;
    add_leg = 23;
    u = smooth_stairs(u);
    
end

% Additional variable for OBR_NORMALIZACIE, OBR_FILTRACIE
%
tn = t;
cas_simulacie=t(length(t));

% Vykreslenie normalizovanej PCH
%
figure('position',[10 60 560 420],'Color','white','Tag','ptt_plot');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t,y_norm_plot],{''blue'',''r--''}},[16,3,4],[add_leg,22],ptv_str_lang)');

Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t,y_norm_plot],{''blue'',''r--''}},[16,3,4],[add_leg,22],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[t,y_norm_plot],{'blue','r--'}},[16,3,4],[add_leg,22],ptv_str_lang)

% Pomocna, aby neskor vedel, ze uz vykonal filtraciu
ic2=0;