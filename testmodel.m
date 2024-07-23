% TESTMODEL
%
%   Testuje parametre zadaneho modelu v NA_MODEL
%   Ak su zadane parametre v poriadku, spusti sa ID_MODEL



% Cast priradenia povodnych hodnot parametrov, ktore nebli teraz zadane

      %CIT
      if(ic(1,1)==0)
          Qcit=cit;
      end

      %MEN      
      if(ic(1,2)==0)
          Qmen=men;
      end
      
      %D
      if(ic(1,3)==0)
        QD=D;
      end
      
      %cas_simulacie
      if(ic(1,4)==0)
        Qcas_simulacie=cas_simulacie;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&sum(size(Qcit)>0)&&isreal(Qcit)==1)
        Q = size(Qcit);
        if(Qcit(1)~='?'&&Q(1)==1)
              cit=Qcit;                
        end
        clear('Q');
      end
      if(ic(1,2)==1&&sum(size(Qmen)>0)&&isreal(Qmen)==1)
        Q = size(Qmen);
        if(Qmen(1)~='?'&&Q(1)==1)
              men=Qmen;         
        end
        clear('Q');
      end
      if(ic(1,3)==1&&test_cor(QD)==1&&QD>=0)
        D=QD;
      end
      if(ic(1,4)==1&&test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(sum(size(Qcit))==0||sum(size(Qmen))==0||test_cor(QD,Qcas_simulacie)~=1||...
   isreal([QD,Qcas_simulacie])~=1||isreal(Qcit)~=1||isreal(Qmen)~=1)
      
    pth_fig = ptg_error('na_model',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error('na_model',ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error('na_model',ptg_string(9,7,ptv_str_lang),ptv_str_lang);


% Kontrola, ci bola v CIT alebo MEN zmenena hodnota '???'
%
% CIT, MEN

elseif((Qcit(1)=='?'&&ic(1,1)==0)||(Qmen(1)=='?'&&ic(1,2)==0))
    pth_fig = ptg_error('na_model',ptg_string(9,13,ptv_str_lang),ptv_str_lang);


% Ak sa nenasla ziadna chyba v zadanych parametroch
  else
      % Kontrola, ci je QCIT a QMEN vektor a nie matica:
      Q=zeros(1,4);
      [Q(1) Q(2)]=size(Qcit);
      [Q(3) Q(4)]=size(Qmen);
      
      if(Q(1)~=1||Q(3)~=1)
         pth_fig = ptg_error('na_model',ptg_string(9,13,ptv_str_lang),ptv_str_lang);

     elseif(Q(4)==1)
         pth_fig = ptg_error('na_model',ptg_string(9,36,ptv_str_lang),ptv_str_lang);

      else

      % Kontrola vlastnosti prenosu
      [Q(1,1) Q(1,2) Q(1,3) Q(1,4)]=test_gs_prop(cit,men,1,'na_model',ptv_str_lang);
      
      % Ak sa nenasla ziadna chyba vo vlastnostiach zadaneho prenosu
  
      if(sum(Q)==4)
        clear('Q');

        if(typ_i==2)
           K = cit;
           M = men;
           sim('generujpch')
           t = pch(:,1);
           ynew = pch(:,2);
           yn = ynew;
           naspat='na_model';
           [OK,K,T_km,ksi_km,D_km] = km_id(pch(:,1),pch(:,2),naspat);
           %
           % Identifikovany system je tlmene kmitavy
           %
           typ_i2 = 2;
           %
           param_km
        else
           K = cit;
           M = men;
           
           % Identifikovany system je aperiodicky
           %
           typ_i2 = 1;
    
           id_model    % Identifikacia podla Strejca
        end
      end
      
    end
    
  end