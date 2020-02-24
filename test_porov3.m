% TEST_POROV3
% Testuje parametre zadaneho modelu v POROVNAT
% Ak su zadane parametre v poriadku, spusti sa POROVNAT2

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

      if(test_cor(QK)==1)
        KK=QK;
      end
      if(test_cor(QT_km)==1&&(QT_km>0))
        TT_km=QT_km;
      end
      if(test_cor(Qksi_km)==1&&(Qksi_km<1)&&(Qksi_km>0))
        kksi_km=Qksi_km;
      end
      if(test_cor(QD_km)==1&&QD_km>=0)
        DD_km=QD_km;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(test_cor(QT_km,QK,QD_km,Qksi_km,Qcas_simulacie)~=1)
    pth_fig = ptg_error(naspat,ptg_string(9,1,ptv_str_lang),ptv_str_lang);
    
elseif(QT_km<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,42,ptv_str_lang),ptv_str_lang);

elseif(QD_km<0)
    pth_fig = ptg_error(naspat,ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif((Qksi_km>=1)||(Qksi_km<=0))
    pth_fig = ptg_error(naspat,ptg_string(9,4,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error(naspat,ptg_string(9,7,ptv_str_lang),ptv_str_lang);
    
else
      [L,N]=get_tf(2,kksi_km,KK,TT_km);
      porovnat2
end