% NORMALIZACIA
%
%   Tu zacinaju skripty na spracovanie udajov z datoveho suboru
%
%   Spusta - TESTDU


   
    
if(size(data,2) > 3 | size(data,2) < 2)
    pth_fig = ptg_error('citsub',ptg_string(9,26,ptv_str_lang),ptv_str_lang);
else
clear a;

% Graf - Nacitane data
t = data(:,1);
y = data(:,2);

y_plot = y;
add_leg = '';

if(size(data,2)==3)
    %
    % Test ci vektor U obsahuje skok
    %
    u_temp = find(data(:,3)~=data(1,3));
        if (isempty(u_temp) == 0)
            %
            % Vektor U obsahuje skok
            %
            t0 = t(1);
            u = data(:,3);
            y_plot = [y,u];
            add_leg = [2];
        else
            data = data(:,1:2); % Vymazanie vektora U, ktory neobsahuje skok
        end
end

cas_simulacie=t(length(t));

figure('position',[10 60 560 420],'Color','white','Tag','ptt_plot');

Qch5=uicontrol(gcf,'Tag','ptt_ch5',...
    'Style','Check','Units','Pixels','Position',[20 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,1,ptv_str_lang),...
    'Value',Qcheck_yL,...
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t,y_plot],{''blue'',''r--''}},[15,3,4],[4,add_leg],ptv_str_lang)');

Qch6=uicontrol(gcf,'Tag','ptt_ch6',...
    'Style','Check','Units','Pixels','Position',[100 7 70 20],...
    'ForegroundColor','Black',...
    'BackgroundColor',get(gcf,'Color'),...  
    'String',ptg_string(5,2,ptv_str_lang),...
    'Value',Qcheck_yG,...    
    'Callback','ptg_plot_check(ptf_checkval(''ptt_ch5''),ptf_checkval(''ptt_ch6''),{[t,y_plot],{''blue'',''r--''}},[15,3,4],[4,add_leg],ptv_str_lang)');

    ptg_plot_check(ptf_checkval('ptt_ch5'),ptf_checkval('ptt_ch6'),{[t,y_plot],{'blue','r--'}},[15,3,4],[4,add_leg],ptv_str_lang)


% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,2);

Qt0=t0;
Qdelta_u=delta_u;

% Velkost okna normalizacie
%
%   Lebo ak je nacitany subor t-y-u, tak netreba zadavat t0 a delta_u,
%   iba ak vektor vstupov U neobsahuje skok
%
if(size(data,2)==2)

    fig_position = [90 130 220 200];
    
else
    
    fig_position = [90 130 220 50];
    
end

figure('Color','blue',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...
          'Numbertitle','off',...
          'name',ptg_string(1,12,ptv_str_lang), ...
          'position',fig_position);

%---------------------------- text -----------------------------------------

       uvod_text= uicontrol(gcf,...
          'Style','text',...
          'Position',[20,130,180,50],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(2,12,ptv_str_lang));

%--------------------------- t0 --------------------------------------

       Qt0_text= uicontrol(gcf,...
          'Style','text',...
          'Position',[20,90,90,25],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(8,35,ptv_str_lang));

       Qt0 =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[12],...
          'String',num2str(Qt0),...
          'Position',[100,90, 100 25],...
          'CallBack',['ic(1,2)=1;Qt0=str2num(get(gco,''String''));']);

    
%--------------------------- delta_u --------------------------------------

       Qdelta_u_text= uicontrol(gcf,...
          'Style','text',...
          'Position',[20,55,90,25],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(8,47,ptv_str_lang));

       Qdelta_u =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[12],...
          'String',num2str(Qdelta_u),...
          'Position',[100,55, 100 25],...
          'CallBack',['ic(1,1)=1;Qdelta_u=str2num(get(gco,''String''));']);

%--------------------------------------------------------------------------

pokracovat = uicontrol(gcf,...
          'Style','push',...
          'Position',[80 10 120 30],...
          'String',ptg_string(3,19,ptv_str_lang),...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'ForegroundColor','red',...
          'CallBack','close,close(findobj(''Tag'',''ptt_plot'')),testdu');
      
navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[20 10 50 30],...
          'Fontsize',[11],...
          'Fontweight','bold',...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'Callback','close,close(findobj(''Tag'',''ptt_plot'')),citsub');

end