% TESTMODEL2
%
%   Testuje parametre zadaneho modelu v NA_MODEL
%   Ak su zadane parametre v poriadku, spusti sa ID_MODEL2

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


% Cast priradenia korektne zadnaych parametrov

      if(test_cor(Qn)==1&&mod(Qn,1)==0&&Qn>0&&Qn<9)
        n=Qn;
      end
      if(test_cor(QK)==1)
        K=QK;
      end
      if(test_cor(QT)==1)
        T=QT;
      end
      if(test_cor(QD)==1&&QD>=0)
        D=QD;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(test_cor(Qn,QT,QK,QD,Qcas_simulacie)~=1)
    pth_fig = ptg_error('na_model',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif (mod(Qn,1)~=0||Qn<1)
    pth_fig = ptg_error('na_model',ptg_string(9,2,ptv_str_lang),ptv_str_lang);
    
elseif (Qn>8)
    pth_fig = ptg_error('na_model',ptg_string(9,48,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error('na_model',ptg_string(9,3,ptv_str_lang),ptv_str_lang);
    
elseif(QT<=0)
    pth_fig = ptg_error('na_model',ptg_string(9,41,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error('na_model',ptg_string(9,7,ptv_str_lang),ptv_str_lang);
    
else

    % Identifikovany system je aperiodicky
    %
    typ_i2 = 1;

    nizsien
end