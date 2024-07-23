% TESTDU
% Testuje parametre zadane v NORMALIZACIA
% Ak su zadane parametre v poriadku, spusti sa OBR_NORMALIZACIE a VYB_FIL
%



% Cast priradenia povodnych hodnot parametrov, ktore nebli teraz zadane

      if(ic(1,2)==0)
        Qt0=t0;
      end
      if(ic(1,1)==0)
        Qdelta_u=delta_u;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,2)==1&&test_cor(Qt0)==1&&~(isempty(find(data(:,1)==Qt0))))
        t0=Qt0;
      end
      if(ic(1,1)==1&&test_cor(Qdelta_u)==1)
        delta_u=Qdelta_u;
      end
      
% Cast hladania nekorektnych udajov

if(test_cor(Qt0)==1&&isempty(find(data(:,1)==Qt0)))
    pth_fig = ptg_error('normalizacia',ptg_string(9,27,ptv_str_lang),ptv_str_lang);

elseif(test_cor(Qt0)~=1||test_cor(Qdelta_u)~=1)      
    pth_fig = ptg_error('normalizacia',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
else
      obr_normalizacie,vyb_fil
end