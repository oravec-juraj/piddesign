% TESTMODEL3
%
%   Testuje parametre zadaneho modelu v NA_MODEL
%   Ak su zadane parametre v poriadku, spusti sa ID_MODEL3



% Cast priradenia korektne zadnaych parametrov

      if(test_cor(QK)==1)
        K=QK;
      end
      if(test_cor(QT_km)==1)
        T_km=QT_km;
      end
      if(test_cor(Qksi_km)==1)
        ksi_km=Qksi_km;
      end
      if(test_cor(QD_km)==1&&QD_km>=0)
        D_km=QD_km;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QT_km,QK,QD_km,Qksi_km,Qcas_simulacie)~=1)
     pth_fig = ptg_error('na_model',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
     
elseif(QD_km<0)
    pth_fig = ptg_error('na_model',ptg_string(9,3,ptv_str_lang),ptv_str_lang);
    
elseif(QT_km<=0)
    pth_fig = ptg_error('na_model',ptg_string(9,42,ptv_str_lang),ptv_str_lang);

elseif(Qksi_km<=0||Qksi_km>=1)
    pth_fig = ptg_error('na_model',ptg_string(9,4,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error('na_model',ptg_string(9,7,ptv_str_lang),ptv_str_lang);

else
    id_model3
end