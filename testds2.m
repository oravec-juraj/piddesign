% TESTDS2
% Skript na testovanie zadaneho datoveho suboru MENO zadany v ULOZIT
% Ak su zadane parametre v poriadku, spusti sa FILTRACIA
%

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


    
% Pomocna premenna, ktora nadobuda hodnotu zadanej pripony suboru, alebo medzreu
if(length(meno)>3)
    ic=[meno(end-3) meno(end-2) meno(end-1) meno(end)];
else
    ic=' ';
end

% Kontrola pripony suboru
%
if((length(meno)<5)||(sum(ic~='.txt')~=0&&(sum(ic~='.dat'))~=0))
    pth_fig = ptg_error('ulozit',ptg_string(9,25,ptv_str_lang),ptv_str_lang);
    
else
    tt=[t yn];
    save([adr,meno],'tt','-ascii');
        
    if(exist([adr,meno],'file')==2)
      fig = figure('Color','yellow',...
          'Resize','off',...
          'Menubar',ptv_fig_menubar,...s
          'Numbertitle','off',...
          'name',ptg_string(1,7,ptv_str_lang), ...
          'position',[100 50 260 100]);
      
    % Clolourful effect
    ptv_cfbcg = get(findobj('Tag','pt'),'UserData');
    if(ptv_cfbcg==1)
        ptf_cfbcg(gcf,2)
    end
    
      navrh_text= uicontrol(gcf,...
          'Style','text',...
          'position',[15 8 235 80],...
          'Fontsize',[12],...
          'ForegroundColor','black',...
          'BackgroundColor',[fgcolor],... 
          'Fontweight','bold',...
          'HorizontalAlignment','center',...
          'String',ptg_string(2,14,ptv_str_lang));
         porucha = uicontrol(gcf,...
          'Style','push',...
          'Position',[85 12 90 25],...
          'Fontsize',[12],...
          'Fontweight','bold',...
          'String','OK',...
          'ForegroundColor','black',...
          'CallBack','close,filtracia');
    else
      pth_fig = ptg_error('filtracia',ptg_string(9,35,ptv_str_lang),ptv_str_lang);
   
    end
end