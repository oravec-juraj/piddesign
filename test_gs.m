% TEST_GS
% Testuje parametre regulovaneho prenosu G(s) zadane v ZISKAT_GS
% Ak su zadane parametre v poriadku, vypocita sa vseobecny tvar prenosu a
% spusti sa - SIMUL_PARAM
%



% Cast priradenia povodnych hodnot parametrov, ktore nebli teraz zadane

if(ic(1,1)==0)
        Qnn=nn;
      end
      if(ic(1,2)==0)
        QKK=KK;
      end
      if(ic(1,3)==0)
        QTT=TT;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&test_cor(Qnn)==1&&mod(Qnn,1)==0&&Qnn>0)
        nn=Qnn;
      end
      if(ic(1,2)==1&&test_cor(QKK)==1)
        KK=QKK;
      end
      if(ic(1,3)==1&&test_cor(QTT)==1&&(QTT>0))
        TT=QTT;
      end

% Cast hladania nekorektnych udajov

if(test_cor(Qnn,QTT,QKK)~=1)
      pth_fig = ptg_error('ziskat_gs',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif (mod(Qnn,1)~=0||Qnn<1)
      pth_fig = ptg_error('ziskat_gs',ptg_string(9,2,ptv_str_lang),ptv_str_lang);
 
elseif (QTT<=0)
      pth_fig = ptg_error('ziskat_gs',ptg_string(9,41,ptv_str_lang),ptv_str_lang);

else
        % Parametre vseobecneho prenosu G(s)=cit/men
        [cit,men] = get_tf(1,nn,KK,TT);
        
        simul_param
end