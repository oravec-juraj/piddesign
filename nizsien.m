% NIZSIEN
%
%   Skript na nacitanie hodnoty radu N pre Identifikaciu s nizsim radom N
%
%   Spusta - TESTN



% ic je vektor na kontrolu zadania vstupov
ic=zeros(1,1);

n_max = n;

if(n_max==1)
    pth_fig = ptg_error(naspat,ptg_string(9,37,ptv_str_lang),ptv_str_lang);
else
    
    fig = figure('Color','blue',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...
          'Numbertitle','off',...
          'name',ptg_string(1,3,ptv_str_lang), ...
          'position',[100 200 200 150]);

% Clolourful effect
ptf_cfbcg(gcf,ptv_cfbcg)

      n2_text =  uicontrol(gcf,...
          'Style','text',...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'Position',[15 50 175 80],...
          'String',ptg_string(2,17,ptv_str_lang));
%------------------------------- Povodne n ------------------------------  
n2_text = uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',[fgcolor],... 	
          'Position',[20 60 80 25],...
          'String',ptg_string(8,52,ptv_str_lang));

n3_text = uicontrol(gcf,...
          'Style','text',...
          'ForegroundColor','black',...
          'Fontweight','bold',...
          'Fontsize',[12],...
          'BackgroundColor',[fgcolor],... 	
          'Position',[93 60 25 25],...
          'String',num2str(n_max));
%-------------------------------------------------------------------------

       n2t =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'Fontsize',[11],...
          'BackgroundColor',[1 1 1],... 	
          'String','???' ,...
          'Position',[115 64 65 25],...
          'CallBack',['ic(1,1)=1;n2=str2num(get(gco,''String''));']);
             
spat = uicontrol(gcf,...
  'Style','push',...
  'Position',[15 15 50 25],...
  'String',ptg_string(3,2,ptv_str_lang),...
  'Fontsize',[11],...
  'Fontweight','bold',...
  'ForegroundColor','black',...
  'CallBack','close;id_param');

potvrdenie = uicontrol(gcf,...
          'Style','push',...
          'Fontsize',[12],...
          'Position',[75 15 115 25],...  
          'Fontweight','bold',...
          'String',ptg_string(3,4,ptv_str_lang),...
          'ForegroundColor','red',...
          'CallBack','close,testn');
end