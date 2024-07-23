% TESTDS
%
%   Skript na testovanie zadaneho datoveho suboru MENO zadany v CITSUB
%   Ak su zadane parametre v poriadku, spusti sa NORMALIZACIA
%



    
% Pomocna premenna, ktora nadobuda hodnotu zadanej pripony suboru, alebo medzreu
if(length(meno)>3)
    ic=[meno(end-3) meno(end-2) meno(end-1) meno(end)];
else
    ic=' ';
end

% Kontrola pripony suboru
%
if((length(meno)<5)||(sum(ic~='.txt')~=0&&(sum(ic~='.dat'))~=0))
    pth_fig = ptg_error('citsub',ptg_string(9,25,ptv_str_lang),ptv_str_lang);
   
else
        if(exist('yn')~=0)  % Cistenie pamate, vyuziva sa v teste v ID_PARAMETRE
            clear('yn');
        end
        data=load([adr,meno],'-ascii');
        normalizacia
end