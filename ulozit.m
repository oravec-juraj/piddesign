% ULOZIT
%
% Ulozi filtrovane data do suboru v tvare [t yn]
% Spusta - TESTDS
%


[meno,adr]=uiputfile('*.*',ptg_string(1,15,ptv_str_lang));
if meno==0 % kvoli nazvu *.*
else
    testds2
end
