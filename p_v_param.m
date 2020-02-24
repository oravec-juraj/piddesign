% P_V_PARAM
%
%   Sluzi na vypocet parametrov P regulatora pomocou vybranej analytickej
%   metody

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


  % Pomocna premenna, aby analyticka metoda vedela, aky typ regulatora
  % sa ma vygenerovat:
  % J3 = 1 pre P reg
  % J3 = 2 pre PI reg
  % J3 = 3 pre PID reg
J3=1;
  
% METODY
%
%------------ Metoda umiestnenia polov ------

if typy_ns == 1
    
    if(n>2)
       pth_fig = ptg_error('reg_v',ptg_string(11,43,ptv_str_lang),ptv_str_lang);
   else
       typy_n=1;
       param_mup
end

% ---------- Naslinova metoda -----------------
elseif typy_ns == 2

  close
  
% Kontrola vhodneho radu:
%
if (n<2)
       pth_fig = ptg_error('reg_v',ptg_string(11,9,ptv_str_lang),ptv_str_lang);
  else
    nm
end

% --------------------------------
%     Metoda nasobneho dominantneho polu
%
elseif typy_ns == 3
    
    % Testovanie aperiodickosti modelu
    %
    if(typ_i==2)
        
        pth_fig = ptg_error('reg_v',ptg_string(11,39,ptv_str_lang),ptv_str_lang);

    else

        [z_r,t_i,t_d] = pta_mdp(3,1,n,K,T);

        close
        simul_param
        
    end

% -------------- %

end
  

              