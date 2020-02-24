% TEST_POROV
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

      if(sum(size(Qcit)>0)&&isreal(Qcit)==1)
        Q = size(Qcit);
        if(Qcit(1)~='?'&&Q(1)==1)
              ccit=Qcit;                
        end
        clear('Q');
      end
      if(sum(size(Qmen)>0)&&isreal(Qmen)==1)
        Q = size(Qmen);
        if(Qmen(1)~='?'&&Q(1)==1)
              mmen=Qmen;         
        end
        clear('Q');
      end
      if(test_cor(QD)==1&&QD>=0)
        DD=QD;
      end
      if(test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
        cas_simulacie=Qcas_simulacie;
      end

% Cast hladania nekorektnych udajov

if(sum(size(Qcit))==0||sum(size(Qmen))==0||test_cor(QD,Qcas_simulacie)~=1||...
   isreal([QD,Qcas_simulacie])~=1||isreal(Qcit)~=1||isreal(Qmen)~=1)

    pth_fig = ptg_error(naspat_porovn,ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(QD<0)
    pth_fig = ptg_error(naspat_porovn,ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error(naspat_porovn,ptg_string(9,7,ptv_str_lang),ptv_str_lang);
% Kontrola, ci bola v CIT alebo MEN zmenena hodnota '???'

% CIT, MEN

elseif(Qcit(1)=='?'||Qmen(1)=='?')
      pth_fig = ptg_error(naspat_porovn,ptg_string(9,13,ptv_str_lang),ptv_str_lang);

% Ak sa nenasla ziadna chyba v zadanych parametroch
  else
      % Kontrola, ci je QCIT a QMEN vektor a nie matica:
      Q=zeros(1,4);
      [Q(1) Q(2)]=size(Qcit);
      [Q(3) Q(4)]=size(Qmen);
      
      if(Q(1)~=1||Q(3)~=1)
        pth_fig = ptg_error(naspat_porovn,ptg_string(9,13,ptv_str_lang),ptv_str_lang);

      else

      % Kontrola vlastnosti prenosu
      [Q(1,1) Q(1,2) Q(1,3) Q(1,4)]=test_gs_prop(ccit,mmen,1,'porovnat',ptv_str_lang);
      
      % Ak sa nenasla ziadna chyba vo vlastnostiach zadaneho prenosu
  
      if(sum(Q)==4)
        clear('Q');
        L=ccit;
        N=mmen;
        porovnat2

      end
      
    end
    
  end