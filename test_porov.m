% TEST_POROV
% Testuje parametre zadaneho modelu v POROVNAT
% Ak su zadane parametre v poriadku, spusti sa POROVNAT2



% Cast priradenia korektne zadnaych parametrov

      if(sum(size(Qcit)>0)&&isreal(Qcit)==1)
        Q = size(Qcit);
        if(Qcit(1)~='?'&&Q(1)==1)
              ccit=Qcit;                
        end
        clear('Q');
      end
      if(sum(size(Qmen)>0)&&isreal(Qmen)==1)
        Q = size(Qmen);
        if(Qmen(1)~='?'&&Q(1)==1)
              mmen=Qmen;         
        end
        clear('Q');
      end
      if(test_cor(QD)==1&&QD>=0)
        DD=QD;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(sum(size(Qcit))==0||sum(size(Qmen))==0||test_cor(QD,Qcas_simulacie)~=1||...
   isreal([QD,Qcas_simulacie])~=1||isreal(Qcit)~=1||isreal(Qmen)~=1)

    pth_fig = ptg_error(naspat_porovn,ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error(naspat_porovn,ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error(naspat_porovn,ptg_string(9,7,ptv_str_lang),ptv_str_lang);
% Kontrola, ci bola v CIT alebo MEN zmenena hodnota '???'

% CIT, MEN

elseif(Qcit(1)=='?'||Qmen(1)=='?')
      pth_fig = ptg_error(naspat_porovn,ptg_string(9,13,ptv_str_lang),ptv_str_lang);

% Ak sa nenasla ziadna chyba v zadanych parametroch
  else
      % Kontrola, ci je QCIT a QMEN vektor a nie matica:
      Q=zeros(1,4);
      [Q(1) Q(2)]=size(Qcit);
      [Q(3) Q(4)]=size(Qmen);
      
      if(Q(1)~=1||Q(3)~=1)
        pth_fig = ptg_error(naspat_porovn,ptg_string(9,13,ptv_str_lang),ptv_str_lang);

      else

      % Kontrola vlastnosti prenosu
      [Q(1,1) Q(1,2) Q(1,3) Q(1,4)]=test_gs_prop(ccit,mmen,1,'porovnat',ptv_str_lang);
      
      % Ak sa nenasla ziadna chyba vo vlastnostiach zadaneho prenosu
  
      if(sum(Q)==4)
        clear('Q');
        L=ccit;
        N=mmen;
        porovnat2

      end
      
    end
    
  end