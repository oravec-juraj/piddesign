% TEST_POROV2
% Testuje parametre zadaneho modelu v POROVNAT
% Ak su zadane parametre v poriadku, spusti sa POROVNAT2



% Cast priradenia korektne zadnaych parametrov

      if(test_cor(Qn)==1&&mod(Qn,1)==0&&Qn>0)
        nn=Qn;
      end
      if(test_cor(QK)==1)
        KK=QK;
      end
      if(test_cor(QT)==1&&(QT>0))
        TT=QT;
      end
      if(test_cor(QD)==1&&QD>=0)
        DD=QD;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(test_cor(Qn,QT,QK,QD,Qcas_simulacie)~=1)
    pth_fig = ptg_error(naspat,ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif (mod(Qn,1)~=0||Qn<1)
    pth_fig = ptg_error(naspat,ptg_string(9,2,ptv_str_lang),ptv_str_lang);

elseif(QT<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,41,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error(naspat,ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,7,ptv_str_lang),ptv_str_lang);

else
      [L,N]=get_tf(1,nn,KK,TT);
      porovnat2
end