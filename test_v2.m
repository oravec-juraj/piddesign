% TEST_V2
% Testuje parametre zadaneho modelu v PARAM_VL2
% Ak su zadane parametre v poriadku, spusti sa REG_V



% Cast priradenia korektne zadnaych parametrov

      if(test_cor(QK)==1)
        K=QK;
      end
      if(test_cor(QT_km)==1)
        T_km=QT_km;
      end
      if(test_cor(Qksi_km)==1&&Qksi_km>0&&Qksi_km<=1)
        ksi_km=Qksi_km;
      end
      if(test_cor(QD_km)==1&&QD_km>=0)
        D_km=QD_km;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QT_km,QK,QD_km,Qksi_km)~=1)
      pth_fig = ptg_error('param_vl2',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
      
elseif(QD_km<0)
    pth_fig = ptg_error('param_vl2',ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(Qksi_km<0||Qksi_km>1)
    pth_fig = ptg_error('param_vl2',ptg_string(9,4,ptv_str_lang),ptv_str_lang);

else
      J1 = 1;
      ptv_typtm = 2;    % Analyticke metody
      reg_v
end