% TESTO
% Testuje v FILTRACIA
% ci si filter vyzaduje zadanie parametra OMEGA jednym alebo dvoma prvkami

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


% OMEGA ma mat 2 prvoky pre PASMOVY UZAVER
%
if(typfil(2)==3)
    if(ic(1,2)==1&&length(Qomega)~=2)
          if(Qomega(1)>=1||Qomega(1)<=0)
              Qomega=omega;
          end
        pom=Qomega;
        Qomega=zeros(1,2);
        Qomega(1)=pom;
        clear('pom');
        omega=Qomega;           
    end
    if(ic(1,2)==0&&length(omega)~=2&&isreal(Qomega)==1)
        pom=omega;
        Qomega=zeros(1,2);
        Qomega(1)=pom;
        clear('pom');
        omega=Qomega;        
        
    
    if(Qomega(1)<0.9)
           Qomega(2)=Qomega(1)+0.1;
           clear('pom');
           omega=Qomega;           
    else
           Qomega(2)=Qomega(1);
           Qomega(1)=Qomega(2)-0.1;
           clear('pom');
           omega=Qomega;
    end

    end

    if(ic(1,2)==0&&length(omega)==2&&isreal(omega)==1)
        Qomega=omega;
    end
       Qomega =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[11],...
          'String',num2str(Qomega),...
          'Position',[120 115 100 25],...
          'CallBack',['ic(1,2)=1;Qomega=str2num(get(Qomega,''String''));']);      
  end
  
  % OMEGA ma mat 1 prvok pre HORNOPRIEPUSTNY FILTER
  %
  if(typfil(2)==2)
    if(ic(1,2)==1&&length(Qomega)~=1&&isreal(Qomega)==1)
          if(Qomega(1)>=1||Qomega(1)<=0)
              Qomega=omega;
          end
        pom=Qomega(1);
        Qomega=zeros(1,1);
        Qomega=pom;
        clear('pom');    
        omega=Qomega;    
    end
    
    if(ic(1,2)==0)
        pom=omega(1);
        Qomega=zeros(1,1);
        Qomega=pom;
        clear('pom');    
        omega=Qomega;    
    end

       Qomega =  uicontrol(gcf,...
          'Style','edit',...
          'ForegroundColor','black',...
          'BackgroundColor',[1 1 1],...
          'HorizontalAlignment','center',...
          'Fontsize',[11],...
          'String',num2str(Qomega),...
          'Position',[120 115 100 25],...
          'CallBack',['ic(1,2)=1;Qomega=str2num(get(Qomega,''String''));']);      
  end