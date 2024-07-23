% TEST_POROV3
% Testuje parametre zadaneho modelu v POROVNAT
% Ak su zadane parametre v poriadku, spusti sa POROVNAT2



% Cast priradenia korektne zadnaych parametrov

      if(test_cor(QK)==1)
        KK=QK;
      end
      if(test_cor(QT_km)==1&&(QT_km>0))
        TT_km=QT_km;
      end
      if(test_cor(Qksi_km)==1&&(Qksi_km<1)&&(Qksi_km>0))
        kksi_km=Qksi_km;
      end
      if(test_cor(QD_km)==1&&QD_km>=0)
        DD_km=QD_km;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QT_km,QK,QD_km,Qksi_km,Qcas_simulacie)~=1)
    pth_fig = ptg_error(naspat,ptg_string(9,1,ptv_str_lang),ptv_str_lang);
    
elseif(QT_km<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,42,ptv_str_lang),ptv_str_lang);

elseif(QD_km<0)
    pth_fig = ptg_error(naspat,ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif((Qksi_km>=1)||(Qksi_km<=0))
    pth_fig = ptg_error(naspat,ptg_string(9,4,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,7,ptv_str_lang),ptv_str_lang);
    
else
      [L,N]=get_tf(2,kksi_km,KK,TT_km);
      porovnat2
end