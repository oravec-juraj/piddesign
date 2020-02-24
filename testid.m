% TESTID
%
%   Testuje parametre zadane v SUS
%
%   Ak su zadane parametre v poriadku, spustia sa SUSTAVY 
%   alebo KM_SUSTAVY a PARAM_KM
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
        Qu_0=u_0;
      end
      if(ic(1,2)==0)
        Qu_nek=u_nek;
      end
      if(ic(1,3)==0)
        Qy_0=y_0;
      end
      if(ic(1,4)==0)
        Qy_nek=y_nek;
      end
      if(ic(1,5)==0)
        Qt0=t0;
      end
      if(ic(1,6)==0)
        Qt_D=t_D;
      end
      if(ic(1,7)==0)
        Qt1=t1;
      end
      if(ic(1,8)==0)
        Qt2=t2;
      end
      if(ic(1,9)==0)
        Qcas_simulacie=cas_simulacie;
      end
      if(ic(1,10)==0)
        Qy_max=y_max;
      end
      if(ic(1,11)==0)
        Qy_min=y_min;
      end
      
% Cast priradenia korektne zadnaych parametrov

   if(ic(1,1)==1&&test_cor(Qu_0)==1)
        u_0=Qu_0;
      end
      if(ic(1,2)==1&&test_cor(Qu_nek)==1)
        u_nek=Qu_nek;
      end
      if(ic(1,3)==1&&test_cor(Qy_0)==1)
        y_0=Qy_0;
      end
      if(ic(1,4)==1&&test_cor(Qy_nek)==1)
        y_nek=Qy_nek;
      end
      if(ic(1,5)==1&&test_cor(Qt0)==1&&test_cor(Qt1)==1)
          if(Qt0<Qt1)
              t0=Qt0;
          end
      end
      if(ic(1,6)==1&&test_cor(Qt1)==1&&test_cor(Qt0)==1&&test_cor(Qt_D)==1)
          if(Qt0<=Qt_D&&Qt_D<Qt1)
              t_D=Qt_D;
          end
      end
      if(ic(1,7)==1&&test_cor(Qt1)==1&&test_cor(Qt_D)==1&&test_cor(Qt2)==1)
          if(Qt_D<=Qt1&&Qt1<Qt2)
              t1=Qt1;
          end
      end
      if(ic(1,8)==1&&test_cor(Qt2)==1&&test_cor(Qt1)==1)
          if(Qt1<Qt2)
              t2=Qt2;
          end
      end
      if(ic(1,9)==1&&test_cor(Qcas_simulacie)==1&&Qcas_simulacie>0&&Qt2<Qcas_simulacie)
        cas_simulacie=Qcas_simulacie;
      end
      if(ic(1,10)==1&&test_cor(Qy_max)==1&&test_cor(Qy_min)==1&&test_cor(Qy_0)==1)
          if((Qy_nek>Qy_0)&&((Qy_max>Qy_min&&Qy_max>Qy_0)))||((Qy_nek<Qy_0)&&((Qy_max<Qy_min&&Qy_max<Qy_0)))
              y_max=Qy_max;
          end
      end
      if(ic(1,11)==1&&test_cor(Qy_max)==1&&test_cor(Qy_min)==1&&test_cor(Qy_0)==1)
          if((Qy_nek>Qy_0)&&((Qy_max>Qy_min&&Qy_max>Qy_0)))||((Qy_nek<Qy_0)&&((Qy_max<Qy_min&&Qy_max<Qy_0)))
              y_min=Qy_min;
          end
      end

% Cast hladania nekorektnych udajov

if(test_cor(n,Qu_0,Qu_nek,Qy_0,Qy_nek,Qt0,Qt_D,Qt1,Qt2,Qcas_simulacie)~=1||(typ_i==2&&(test_cor(Qy_max)~=1||test_cor(Qy_min)~=1)))
    pth_fig = ptg_error('sus',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

      
  elseif (Qcas_simulacie<=0)
     pth_fig = ptg_error('sus',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

  elseif (Qt0>Qt_D||Qt_D>Qt1||Qt1>=Qt2||Qt2>=Qcas_simulacie)
     pth_fig = ptg_error('sus',ptg_string(9,14,ptv_str_lang),ptv_str_lang);

  elseif ((typ_i==2) && (Qy_0 < Qy_nek) && ( (Qy_max<Qy_0)||(Qy_max<Qy_min)||(Qy_min>Qy_nek) )) ||...
         ((typ_i==2) && (Qy_0 > Qy_nek) && ( (Qy_max>Qy_0)||(Qy_max>Qy_min)||(Qy_min<Qy_nek) ))
  
       pth_fig = ptg_error('sus',ptg_string(9,15,ptv_str_lang),ptv_str_lang);

  else
      if(typ_i==1)
          sustavy
      else
          % Vypocitanie parametrov tlmene kmitaveho systemu
          [K,T_km,ksi_km,D_km]=km_sustavy(t0,t_D,t1,t2,y_0,y_max,y_min,y_nek,u_0,u_nek,cas_simulacie);
          naspat='close,sus';
          OK = 1;   % uistenie param_km, ze vsetky parametre boli spravne vypocitane, lebo ked sa inde pouzije KM_ID, tak nemusia
          t = [0;ptv_sim_step];
          param_km
      end
  end