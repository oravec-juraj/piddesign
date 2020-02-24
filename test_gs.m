% TEST_GS
% Testuje parametre regulovaneho prenosu G(s) zadane v ZISKAT_GS
% Ak su zadane parametre v poriadku, vypocita sa vseobecny tvar prenosu a
% spusti sa - SIMUL_PARAM
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