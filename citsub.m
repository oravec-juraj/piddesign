% CITSUB
%
%   Nacita data prechodovanej charakteristiky pre potreby identifikacie z datoveho suboru
%   Spusta - TESTDS
%


[meno,adr]=uigetfile('*.*',ptg_string(1,11,ptv_str_lang));
if meno==0 % kvoli nazvu *.*
else 
    close(findobj('Tag','ptt_vyb_ident'))
    testds
end
