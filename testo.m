% TESTO
% Testuje v FILTRACIA
% ci si filter vyzaduje zadanie parametra OMEGA jednym alebo dvoma prvkami



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