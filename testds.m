% TESTDS
%
%   Skript na testovanie zadaneho datoveho suboru MENO zadany v CITSUB
%   Ak su zadane parametre v poriadku, spusti sa NORMALIZACIA
%

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk
% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------


    
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