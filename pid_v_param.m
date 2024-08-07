% PID_PARAM
%
%   Sluzi na vypocet parametrov PID regulatora pomocou vybranej analytickej
%   metody



  % Pomocna premenna, aby analytick?metoda vedela, aky typ regulatora
  % sa ma vygenerovat:
  % J3 = 1 pre P reg
  % J3 = 2 pre PI reg
  % J3 = 3 pre PID reg
  J3=3;
  
% METODY
%
%------------ Metoda umiestnenia polov ------

if typy_ns == 1
    if(n<2||n>3)
        pth_fig = ptg_error('reg_v',ptg_string(11,29,ptv_str_lang),ptv_str_lang);
    else
        typy_n=1;
        param_mup
    end

% ---------- Naslinova met�da -----------------
elseif typy_ns == 2

  close
  
    if(n<3)
        pth_fig = ptg_error('reg_v',ptg_string(11,10,ptv_str_lang),ptv_str_lang);
    else
        nm
    end

%--------------------------------------------------------------------------          
% METODA ZAL. NA BEZPECNOSTI VO FAZE A V ZOSILNENI
elseif typy_ns==3

% Cast kontrolovania vhodneho rad n a nenuloveho dopravneho oneskorenia D

if(n~=2||typ_i==2)
    pth_fig = ptg_error('reg_v',ptg_string(11,30,ptv_str_lang),ptv_str_lang);
 
elseif(D==0)
    pth_fig = ptg_error('reg_v',ptg_string(11,31,ptv_str_lang),ptv_str_lang);
 
else

% Pomocna premenna ic3 pre kontrolu zadania Am a Pm
ic3=zeros(1,2);

QGm = Gm;
QPm = Pm;

     fig = figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'Name',ptg_string(1,2,ptv_str_lang), ...
          'position',[100 200 215 255]);   
       navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[15 85 185 155],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(11,33,ptv_str_lang));
       %------------------------------- Gm ---------------------------------------         
    Gm_text = uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor','white',... 	
          'Position',[20 130 85 25],...
          'String',ptg_string(11,34,ptv_str_lang));
    QGm = uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor','white',... 	
          'Position',[108 130 85 25],...
          'String',num2str(QGm),...
          'CallBack','ic3(1)=1;QGm=str2num(get(gco,''String''));ic3(1,1)=1;');
       %------------------------------- Pm ---------------------------------------         
    Pm_text = uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor','white',... 	
          'Position',[20 100 85 25],...
          'String',ptg_string(11,35,ptv_str_lang));
    QPm = uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor','white',... 	
          'Position',[108 100 85 25],...
          'String',num2str(QPm),...
          'CallBack','ic3(2)=1;QPm=str2num(get(gco,''String''));ic3(1,2)=1;');
    %----SPAT-----%
    navrat = uicontrol(gcf,...
          'Style','push',...
          'Position',[15 15 60 25],...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'String',ptg_string(3,2,ptv_str_lang),...
          'ForegroundColor','black',...
          'Callback','close,pid_v');
    potvrdenie = uicontrol(gcf,...
          'Style','push',...
          'Position',[100 15 100 25],...
          'Fontweight','bold',...
          'String',ptg_string(3,1,ptv_str_lang),...
          'Fontsize',[11],...
          'ForegroundColor','red',...
          'CallBack','close,test_GmPm');
  end

% ------------------------------------------------------------- %
% M. POZADOVANEHO MODELU
%
elseif typy_ns == 4
    
    % Testovanie kmitavosti modelu
    %

    if(typ_i == 1)&&(n == 2)
      %
      % Aperiodicky model
      %
      close
      typy_ns2=1;     
      fig2 = figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'Name',ptg_string(1,2,ptv_str_lang), ...
          'Position',[120 300 250 80]);
        navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[10 10 120 60],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','left',...
          'String',ptg_string(11,16,ptv_str_lang));
       typyns2 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[20 -25 100 60],...
          'String',ptg_string(11,17,ptv_str_lang),...
          'Value',typy_ns2,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typy_ns2 = get(gco,''Value'');');
        prenos_s = uicontrol(gcf,...
          'Style','push',...
          'Position',[150 45 80 25],...
          'String',ptg_string(3,1,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','black',...
          'CallBack','close,[z_r,t_i,t_d]=pta_rmm(3,K,T,D,(typy_ns2-1)*5);simul_param');
        navrat = uicontrol(gcf,...
           'Style','push',...
           'Position',[150 10 80 25],...
           'String',ptg_string(3,2,ptv_str_lang),...
           'Fontweight','bold',...
           'ForegroundColor','black',...
           'CallBack','close,reg_v');

    elseif(typ_i == 2)&&(ksi_km > 0.5)
      %
      % Tlmene kmitavy model
      %
      close
      typy_ns2=1;     
      fig2 = figure('Color','blue',...
          'Resize','off',...
          'Numbertitle','off',...
          'Menubar',ptv_fig_menubar,...
          'Name',ptg_string(1,2,ptv_str_lang), ...
          'Position',[120 300 250 80]);
        navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[10 10 120 60],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','left',...
          'String',ptg_string(11,16,ptv_str_lang));
       typyns2 = uicontrol(gcf,...
          'Style','popup',...
          'Position',[20 -25 100 60],...
          'String',ptg_string(11,17,ptv_str_lang),...
          'Value',typy_ns2,...
          'ForegroundColor','black',...
          'BackGroundColor','white',...
          'CallBack','typy_ns2 = get(gco,''Value'');');
        prenos_s = uicontrol(gcf,...
          'Style','push',...
          'Position',[150 45 80 25],...
          'String',ptg_string(3,1,ptv_str_lang),...
          'Fontweight','bold',...
          'ForegroundColor','black',...
          'CallBack','close,[z_r,t_i,t_d]=pta_rmm(3,K,Tn,Tu,(typy_ns2-1)*5,ksi_km);simul_param');
        navrat = uicontrol(gcf,...
           'Style','push',...
           'Position',[150 10 80 25],...
           'String',ptg_string(3,2,ptv_str_lang),...
           'Fontweight','bold',...
           'ForegroundColor','black',...
           'CallBack','close,reg_v');

   elseif((typ_i == 2) && (ksi_km <= 0.5))
      pth_fig = ptg_error('reg_v',ptg_string(11,42,ptv_str_lang),ptv_str_lang);

   else
       pth_fig = ptg_error('reg_v',ptg_string(11,40,ptv_str_lang),ptv_str_lang);
   end

% ---------------------------------------------
%
%     Metoda nasobneho dominantneho polu
%
elseif typy_ns == 5
    
    % Testovanie aperiodickosti modelu
    %
    if(typ_i==2)
        pth_fig = ptg_error('reg_v',ptg_string(11,39,ptv_str_lang),ptv_str_lang);

    % Testovanie vhodnosti radu, aby sa predislo deleniu nulou
    %
    elseif (n<3)
        pth_fig = ptg_error('',ptg_string(11,10,ptv_str_lang),ptv_str_lang);

    else
       
       [z_r,t_i,t_d] = pta_mdp(2,3,n,K,T);

       close
       simul_param
  end

%------------ OPTIMAL MODULE CRITERIUM METHOD ------
%
elseif typy_ns == 6

  if(n ~= 3)
       pth_fig = ptg_error('reg_v',ptg_string(11,38,ptv_str_lang),ptv_str_lang);

  elseif( (typ_i == 2 )&&(ksi_km <= 0.71) )
      pth_fig = ptg_error('reg_v',ptg_string(11,41,ptv_str_lang),ptv_str_lang);

  else
      [z_r,t_i,t_d] = pta_omm(3,cit,men);

      if(t_i == -Inf)
          pth_fig = ptg_error('reg_v',ptg_string(11,37,ptv_str_lang),ptv_str_lang);
      else
          simul_param;
      end
  end

%---------------------------------------------------- %
end
       
 
  