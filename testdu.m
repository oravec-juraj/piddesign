% TESTDU
% Testuje parametre zadane v NORMALIZACIA
% Ak su zadane parametre v poriadku, spusti sa OBR_NORMALIZACIE a VYB_FIL
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