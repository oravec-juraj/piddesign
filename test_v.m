% TEST_V
%
%   Testuje parametre zadane v PARAM_VL2
%
%   Ak su zadane parametre v poriadku, spusti sa REG_V

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
        Qn=n;
      end
      
      if(ic(1,2)==0)
        QK=K;
      end
      
      if(ic(1,3)==0)
        QT=T;
      end
      
      if(ic(1,4)==0)
        QD=D;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&test_cor(Qn)==1&&mod(Qn,1)==0&&Qn>0&&Qn<9)
            n=Qn;
      end
          
      if(ic(1,2)==1&&test_cor(QK)==1)
            K=QK;
      end
    
      if(ic(1,3)==1&&test_cor(QT)==1)
            T=QT;
      end
      
      if(ic(1,4)==1&&test_cor(QD)==1&&QD>=0)
            D=QD;
      end
      
% Cast hladania nekorektnych udajov

if(test_cor(Qn,QT,QK,QD)~=1)
    pth_fig = ptg_error('param_vl2',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif (mod(Qn,1)~=0||Qn<1)
    pth_fig = ptg_error('param_vl2',ptg_string(9,2,ptv_str_lang),ptv_str_lang);
    
elseif (Qn>8)
    pth_fig = ptg_error('param_vl2',ptg_string(9,48,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error('param_vl2',ptg_string(9,3,ptv_str_lang),ptv_str_lang);

else
      
      J1 = 1;
      [Tu,Tn] = get_tu_tn(n,K,T,D,1,ptv_str_lang,fgcolor);   % Dopocitanie parametrov Tu a Tn
      ptv_typtm = 1;    % Experimentalne metody
      reg_v
end