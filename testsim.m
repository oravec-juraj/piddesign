% TESTSIM
%
%   Testuje parametre zadane v SIMUL_PARAM
%   Ak su zadane parametre v poriadku, spusti sa SIMUL_P

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
        QW_povodna=W_povodna;
      end
      if(ic(1,2)==0)
        QW_nova=W_nova;
      end
      if(ic(1,3)==0)
        QW_cas_zmeny=W_cas_zmeny;
      end
      if(ic(1,4)==0)
       QR_povodna =R_povodna;
      end
      if(ic(1,5)==0)
        QR_nova=R_nova;
      end
      if(ic(1,6)==0)
        QR_cas_zmeny=R_cas_zmeny;
      end
      if(ic(1,7)==0)
       Qpresnost_riadenia=presnost_riadenia;
      end
      if(ic(1,8)==0)
        Qcas_simulacie=cas_simulacie;
      end
      if(ic(1,9)==0)
        QU_dolne_obmedzenie=U_dolne_obmedzenie;
      end
      if(ic(1,10)==0)
        QU_horne_obmedzenie =U_horne_obmedzenie ;
      end
      if(ic(1,11)==0&&isreal(z_r))
        Qz_r = z_r ;
      end
      if(ic(1,12)==0&&isreal(t_i))
        Qt_i=t_i;
      end
      if(ic(1,13)==0&&isreal(t_d))
        Qt_d=t_d;
      end
      % cit
      if(ic(1,14)==0)
          Qcit=cit;
      end
      % men
      if(ic(1,15)==0)
          Qmen=men;
      end
      % Dr
      if(ic(1,16)==0)
        QDr=Dr;
      end
      if(ic(1,17)==0)
        Qq_u = q_u;
      end
      if(ic(1,18)==0)
        Qq_du = q_du;
      end
      if(ic(1,19)==0)
        Qq_de = q_de;
      end
      if(ic(1,20)==0)
        Qt_r=t_r;
      end      
      if(ic(1,21)==0)
        Qb_w=b_w;
      end
      if(ic(1,22)==0)
        Qt_f=t_f;
      end

% Cast priradenia korektne zadnaych parametrov

    if(ic(1,1)==1&&test_cor(QW_povodna)==1)
        W_povodna=QW_povodna;
      end
      if(ic(1,2)==1&&test_cor(QW_nova)==1)
        W_nova=QW_nova;
      end
      if(ic(1,3)==1&&test_cor(QW_cas_zmeny)==1&&QW_cas_zmeny>=0)
        W_cas_zmeny=QW_cas_zmeny;
      end
      if(ic(1,4)==1&&test_cor(QR_povodna)==1)
       R_povodna =QR_povodna;
      end
      if(ic(1,5)==1&&test_cor(QR_nova)==1)
       R_nova=QR_nova;
      end
      if(ic(1,6)==1&&test_cor(QR_cas_zmeny)==1&&QR_cas_zmeny>=0)
       R_cas_zmeny=QR_cas_zmeny;
      end
      if(ic(1,7)==1&&test_cor(Qpresnost_riadenia)==1&&Qpresnost_riadenia>0&&Qpresnost_riadenia<1)
       presnost_riadenia=Qpresnost_riadenia;
      end
      if(ic(1,8)==1&&test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0)
       cas_simulacie=Qcas_simulacie;
      end
      if(ic(1,9)==1&&test_cor(QU_dolne_obmedzenie)==1&&QU_horne_obmedzenie>QU_dolne_obmedzenie)
        U_dolne_obmedzenie=QU_dolne_obmedzenie;
      end
      if(ic(1,10)==1&&test_cor(QU_horne_obmedzenie)==1&&QU_horne_obmedzenie>QU_dolne_obmedzenie)
        U_horne_obmedzenie =QU_horne_obmedzenie ;
      end
      if(ic(1,11)==1&&test_cor(Qz_r)==1 && ( (Qz_r>0&&Qcit(end)>0)||(Qz_r<0&&Qcit(end)<0) ) )
        z_r = Qz_r ;
      end
      if(ic(1,12)==1&&test_cor(Qt_i)==1&&Qt_i>=0)
          if(Qt_i==0)
              Qt_i=1e10;
          end
          t_i=Qt_i;
      end
      if(ic(1,13)==1&&test_cor(Qt_d)==1&&Qt_d>=0)
        t_d=Qt_d;
      end
      if(ic(1,14)==1&&sum(size(Qcit)>0)&&isreal(Qcit)==1)
        Q = size(Qcit);
        if(Qcit(1)~='?'&&Q(1)==1&&( (Qz_r>0&&Qcit(end)>0)||(Qz_r<0&&Qcit(end)<0) ))
              cit=Qcit;            
        end
        clear('Q');
      end
      if(ic(1,15)==1&&sum(size(Qmen)>0)&&isreal(Qmen)==1)
        Q = size(Qmen);
        if(Qmen(1)~='?'&&Q(1)==1)
              men=Qmen;         
        end
        clear('Q');
      end
      if(ic(1,16)==1&&test_cor(QDr)==1)
        Dr=QDr;
      end
      if(ic(1,17)==1&&test_cor(Qq_u)==1&&Qq_u>=0)
        q_u = Qq_u;
      end
      if(ic(1,18)==1&&test_cor(Qq_du)==1&&Qq_du>=0)
        q_du = Qq_du;
      end
      if(ic(1,19)==1&&test_cor(Qq_de)==1&&Qq_de>=0)
        q_de = Qq_de;
      end   
      if(ic(1,20)==1&&test_cor(Qt_r)==1)
        t_r=Qt_r;
      end
      if(ic(1,21)==1&&test_cor(Qb_w)==1&&(Qb_w>0))
        b_w=Qb_w;
      end
      if(ic(1,22)==1&&test_cor(Qt_f)==1&&(Qt_f>=0))
        t_f=Qt_f;
      end
      
% Cast hladania nekorektnych udajov

if((length(Qz_r)==1&&isreal(Qz_r)==0)||(length(Qt_i)==1&&isreal(Qt_i)==0)||(length(Qt_d)==1&&isreal(Qt_d)==0))
    pth_fig = ptg_error('z_r=real(Qz_r);t_i=real(Qt_i);t_d=real(Qt_d);simul_param',ptg_string(9,6,ptv_str_lang),ptv_str_lang);
end

if(test_cor(Qz_r,Qt_i,Qt_d)~=1||...
        test_cor(QW_povodna,QW_nova,QW_cas_zmeny)~=1||...
        test_cor(QR_povodna,QR_nova,QR_cas_zmeny)~=1||...
        length(Qcit)==0||length(Qmen)==0||...
        isreal(Qcit)~=1||isreal(Qmen)~=1||...
        test_cor(QDr)~=1||...
        test_cor(Qpresnost_riadenia,Qcas_simulacie)~=1||...
        test_cor(QU_dolne_obmedzenie)~=1||...
        test_cor(QU_horne_obmedzenie)~=1||...
        test_cor(Qq_u,Qq_du,Qq_de)~=1||...
        test_cor(Qt_r)~=1||test_cor(Qb_w)~=1||...
        test_cor(Qt_f)~=1)
    
      pth_fig = ptg_error('simul_param',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif(Qcas_simulacie<=0)
    pth_fig = ptg_error('simul_param',ptg_string(9,7,ptv_str_lang),ptv_str_lang);

elseif((Qz_r<0&&Qcit(end)>0)||(Qz_r>0&&Qcit(end)<0))
    pth_fig = ptg_error('simul_param',ptg_string(9,22,ptv_str_lang),ptv_str_lang);

elseif(Qt_i<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,39,ptv_str_lang),ptv_str_lang);

elseif(Qt_d<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,40,ptv_str_lang),ptv_str_lang);
    
elseif(QDr<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,3,ptv_str_lang),ptv_str_lang);

elseif(QW_cas_zmeny<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,8,ptv_str_lang),ptv_str_lang);

elseif(QR_cas_zmeny<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,9,ptv_str_lang),ptv_str_lang);
 
elseif (Qq_u<0 || Qq_du<0 || Qq_de<0)
    pth_fig = ptg_error('simul_param',ptg_string(9,10,ptv_str_lang),ptv_str_lang);

elseif(QU_horne_obmedzenie<QU_dolne_obmedzenie)
    pth_fig = ptg_error('simul_param',ptg_string(9,11,ptv_str_lang),ptv_str_lang);

elseif(Qpresnost_riadenia<=0||Qpresnost_riadenia>=1)
    pth_fig = ptg_error('simul_param',ptg_string(9,12,ptv_str_lang),ptv_str_lang);

elseif(Qb_w<=0)
    pth_fig = ptg_error('simul_param',ptg_string(9,45,ptv_str_lang),ptv_str_lang);

elseif(Qt_f < 0)
    pth_fig = ptg_error('simul_param',ptg_string(9,49,ptv_str_lang),ptv_str_lang);


%------------------- Kontrola prenosu systemu ---------------
%
% Kontrola, ci bola v CIT alebo MEN zmenena hodnota '???'

% CIT, MEN

elseif(Qcit(1)=='?'||Qmen(1)=='?')
      pth_fig = ptg_error('simul_param',ptg_string(9,13,ptv_str_lang),ptv_str_lang);

%-------- Koniec kontorly prenosu systemu ---%

  else
      % Kontrola, ci je QCIT a QMEN vektor a nie matica:
      Q=zeros(1,4);
      [Q(1) Q(2)]=size(Qcit);
      [Q(3) Q(4)]=size(Qmen);
      
      if(Q(1)~=1||Q(3)~=1)
            pth_fig = ptg_error('simul_param',ptg_string(9,13,ptv_str_lang),ptv_str_lang);

      else

      % Kontrola vlastnosti prenosu
      [Q(1) Q(2) Q(3) Q(4)]=test_gs_prop(cit,men,1,'simul_param',ptv_str_lang);
      if(Q(1)==1)
          clear('Q'),simul_p
      end    
      
  end
  
end