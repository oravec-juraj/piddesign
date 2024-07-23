% TESTTURO_PI
% Testuje spravnost zadania prametra TURO v 
% Metode priamej szntezy s pouzitim aproximovaneho modelu URO (PI_PARAM) a
% Riverovej - Morariho metode a Riverovej - Morariho metode (spresneny) (PI_PARAM)
% pomocou pomocnej premennej ic3
% Premenna ic4 zabezpecuje vypocet parametrov regulatora az po korektnom
% zadani Turo (pre ic4==1)



ic4=0;

if(ic3==0|test_cor(QTuro)~=1)
    pth_fig = ptg_error(naspat,ptg_string(9,1,ptv_str_lang),ptv_str_lang);

else

if(ic3(1,1)==1)
        Turo=QTuro;
end
    ic4=1;
end