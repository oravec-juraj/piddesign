% TEST_Gm_Pm
% Testuje parametre zadane v PI_PARAM alebo v PID_PARAM
% Ak su zadane parametre v poriadku, pokracuje sa v PI_PARAM alebo v PID_PARAM
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


% Cast priradenia povodnych hodnot parametrov, ktore nebli teraz zadane

      if(ic3(1,1)==0)
        QGm=Gm;
      end
      
      if(ic3(1,2)==0)
        QPm=Pm;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic3(1,1)==1&&test_cor(QGm)==1&&QGm>1)
            Gm=GAm;
      end
          
      if(ic3(1,2)==1&&test_cor(QPm)==1)
            Pm=QPm;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QGm,QPm)~=1)
    pth_fig = ptg_error('reg_v',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(QGm<=1)
    pth_fig = ptg_error('reg_v',ptg_string(11,36,ptv_str_lang),ptv_str_lang);

else
      Pm = Pm*pi/180;    % Prepocet stupnov na radiany
      wp = (Gm*Pm+pi/2*Gm*(Gm-1))/((Gm^2-1)*D);
      z_r = wp*T/Gm/K;
      t_i = (2*wp-4*D*wp^(2)/pi+1/T)^(-1);
      
      if(n==1)
          t_d = 0;  % Pre PI regulator
      else
          t_d = T;  % Pre PID regulator
      end
      
      clear('wp')
      Pm = Pm*180/pi;   % Prepocet radianov naspat na stupne
      
%         fig = figure('Color','blue',...
%           'Resize','off',...
%           'Numbertitle','off',...
%           'name','Pozor!', ...
%           'position',[40 500 260 150]);      
%         navrh_text= uicontrol(gcf,...
%           'Style','text',...
%           'position',[15 10 235 130],...
%           'Fontsize',[12],...
%           'ForegroundColor','black',...
%           'BackgroundColor',[fgcolor],... 
%           'Fontweight','bold',...
%           'HorizontalAlignment','center',...
%           'String',' Dopo�tali sa tieto hodnoty:');
%         text =  uicontrol(gcf,...
%           'Style','text',...
%           'ForegroundColor','black',...
%           'Fontsize',[11],...
%           'Fontweight','bold',...          
%           'BackgroundColor',[1 1 1],... 	
%           'HorizontalAlignment','center',...         
%           'Position',[40 90 110 23],...
%           'String','Am [dB] =');
%         text2 =  uicontrol(gcf,...
%           'Style','edit',...
%           'ForegroundColor','black',...
%           'Fontsize',[11],...
%           'BackgroundColor',[1 1 1],... 	
%           'Fontweight','bold',... 
%           'String',num2str(pi*T/4/z_r/K/D*(1+sqrt(1-4*D/pi/t_i+4*D/pi/T))),... % Vypocet presnej hodnoty Am
%           'Position',[130 90 100 25],...
%           'CallBack',['']); 
%        text3 =  uicontrol(gcf,...
%           'Style','text',...
%           'ForegroundColor','black',...
%           'Fontsize',[11],...
%           'Fontweight','bold',...          
%           'BackgroundColor',[1 1 1],... 	
%           'HorizontalAlignment','center',...         
%           'Position',[40 60 110 23],...
%           'String','Pm [ � ] =');
%        text4 =  uicontrol(gcf,...
%           'Style','edit',...
%           'ForegroundColor','black',...
%           'Fontsize',[11],...
%           'Fontweight','bold',... 
%           'BackgroundColor',[1 1 1],... 	
%           'String',num2str((pi/2-z_r*K*D/T+(1-T/t_i)*pi/4/z_r/K)*180/pi),... % Vypocet presnej hodnoty Pm v stupnoch
%           'Position',[130 60 100 25],...
%           'CallBack',['']); 
%        text5 = uicontrol(gcf,...
%           'Style','push',...
%           'Position',[85 20 90 25],...
%           'Fontsize',[11],...
%           'String','OK',...
%           'ForegroundColor','red',...
%           'CallBack','close');
      
      simul_param
end