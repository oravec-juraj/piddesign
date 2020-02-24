% TESTFIL
%
%   Testuje parametre zadane vo FILTRACIA
%   Ak su zadane parametre v poriadku, spusti sa OBR_FILTRACIA
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
        Qrad_filtracie=rad_filtracie;
      end
      if(ic(1,2)==0)
        Qomega=omega;
      end
      if(ic(1,3)==0)
        Qzvlnenie=zvlnenie;
      end
      
% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&isreal(Qrad_filtracie)==1&&length(Qrad_filtracie)==1&&mod(Qrad_filtracie,1)==0&&Qrad_filtracie>0)
        rad_filtracie=Qrad_filtracie;
      end
      
      if((ic(1,2)==1&&isreal(Qomega)==1&&length(Qomega)~=0)&&(length(Qomega)==1||length(Qomega)==2))
          if(length(Qomega)==1&&Qomega(1)<1&&Qomega(1)>0)
              omega=Qomega;
          end
          if(length(Qomega)==2&&Qomega(1)~=Qomega(2)&&Qomega(1)<1&&Qomega(1)>0&&Qomega(2)<1&&Qomega(2)>0&&typfil(2)~=2)
              omega=Qomega;
          end
          % Vymena 2 prvkov, ak prvy ma vyssiu hodnotu ako druhy
          if(typfil(1)==1&&length(Qomega)==2&&Qomega(2)<Qomega(1))
            Qomega(2)=Qomega(2)+Qomega(1);
            Qomega(1)=Qomega(2)-Qomega(1);
            Qomega(2)=Qomega(2)-Qomega(1);
          end
      end
      
      if(ic(1,3)==1&&length(Qzvlnenie)==2&&typfil(1)==5&&isreal(Qzvlnenie))
          % Vymena 2 prvkov, ak prvy ma vyssiu hodnotu ako druhy
          if(length(Qzvlnenie)==2&&Qzvlnenie(2)<Qzvlnenie(1))
            Qzvlnenie(2)=Qzvlnenie(2)+Qzvlnenie(1);
            Qzvlnenie(1)=Qzvlnenie(2)-Qzvlnenie(1);
            Qzvlnenie(2)=Qzvlnenie(2)-Qzvlnenie(1);
          end
          zvlnenie=Qzvlnenie;
      end
      if(ic(1,3)==1&&length(Qzvlnenie)==1&&typfil(1)>2&&typfil(1)<5)
        zvlnenie=Qzvlnenie;
      end
      
% Cast hladania nekorektnych udajov

% Vymena 2 prvkov, ak prvy ma vyssiu hodnotu ako druhy
if(length(Qzvlnenie)==2&&Qzvlnenie(2)<Qzvlnenie(1))
    Qzvlnenie(2)=Qzvlnenie(2)+Qzvlnenie(1);
    Qzvlnenie(1)=Qzvlnenie(2)-Qzvlnenie(1);
    Qzvlnenie(2)=Qzvlnenie(2)-Qzvlnenie(1);
end
     
if(length(Qomega)==0||length(Qrad_filtracie)~=1||length(Qzvlnenie)==0||isreal([Qomega,Qrad_filtracie,Qzvlnenie])~=1)
    pth_fig = ptg_error('filtracia',ptg_string(9,1,ptv_str_lang),ptv_str_lang);
     
elseif(test_cor(Qomega,Qomega)>2)||(Qomega(1)<=0||Qomega(1)>=1)...
        ||(length(Qomega)==2)&&(Qomega(2)<=0||Qomega(2)>=1)
    pth_fig = ptg_error('filtracia',ptg_string(9,28,ptv_str_lang),ptv_str_lang);

elseif (mod(Qrad_filtracie,1)~=0||Qrad_filtracie<1)
    pth_fig = ptg_error('filtracia',ptg_string(9,29,ptv_str_lang),ptv_str_lang);

elseif (test_cor(Qomega)~=1&&typfil(2)==2)
    pth_fig = ptg_error('filtracia',ptg_string(9,30,ptv_str_lang),ptv_str_lang);

elseif (length(Qomega)~=2&&test_cor(Qomega)~=1&&typfil(2)==3)
        pth_fig = ptg_error('filtracia',ptg_string(9,31,ptv_str_lang),ptv_str_lang);

elseif(test_cor(Qomega)==1&&length(Qomega)==2)
    if(Qomega(1)==Qomega(2))
        pth_fig = ptg_error('filtracia',ptg_string(9,32,ptv_str_lang),ptv_str_lang);
    end
elseif (test_cor(Qzvlnenie)~=1&&(typfil(1)==3||typfil(1)==4))
    pth_fig = ptg_error('filtracia',ptg_string(9,33,ptv_str_lang),ptv_str_lang);

else
      obr_filtracie
end