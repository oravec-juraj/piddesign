% TEST_GS2
% Testuje parametre regulovaneho prenosu G(s) zadane v ZISKAT_GS pre
% kmitavy system
% Ak su zadane parametre v poriadku, vypocita sa vseobecny tvar prenosu a
% spusti sa - SIMUL_PARAM
%



% Cast priradenia korektne zadnaych parametrov

      if(test_cor(QKK)==1)
        KK=QKK;
      end
      if(test_cor(QTT_km)==1)
        TT_km=QTT_km;
      end
      if(test_cor(Qkksi_km)==1)
        kksi_km=Qkksi_km;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&test_cor(Qkksi_km)==1&&(Qkksi_km>0)&&(Qkksi_km<1))
        kksi_km=Qkksi_km;
      end
      if(ic(1,2)==1&&test_cor(QKK)==1)
        KK=QKK;
      end
      if(ic(1,3)==1&&test_cor(QTT_km)==1&&(QTT_km>0))
        TT_km=QTT_km;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QTT_km,QKK,Qkksi_km)~=1)
    pth_fig = ptg_error('ziskat_gs',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(QTT_km<=0)
    pth_fig = ptg_error('ziskat_gs',ptg_string(9,42,ptv_str_lang),ptv_str_lang);

elseif((Qkksi_km<=0)||(Qkksi_km>=1))
    pth_fig = ptg_error('ziskat_gs',ptg_string(9,4,ptv_str_lang),ptv_str_lang);

else
        % Parametre vseobecneho prenosu G(s)=cit/men
        [cit,men] = get_tf(2,kksi_km,KK,TT_km);
        
        simul_param
  end