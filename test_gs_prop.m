% TEST_GS_PROP
% funkcia na testovanie vlastnosti prenosu Gs=cit/men

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


function [rydz,stab,riad,poz]=test_gs_prop(cit,men,gui,kam,ptv_str_lang)

% premenna GUI urci, ci sa budu chyby vypisovat v GUI

% stringova premenna KAM urci, kam sa ma v pripade navratu vratit

% Test rydzosti
if(length(cit)>length(men))
    rydz = 0;           % Zadany system nie je rydzi
else
    rydz = 1;           % Zadany system je rydzi
end

% Test stability
pol = roots(men);
stab = 1;               % Predpoklad - zadany system je stabilny
for i=1:length(pol)
   if(real(pol(i))>0)
       stab = 0;        % Zadany system je nestabilny
   elseif(real(pol(i))==0)
       stab = -1;       % Zadany system je na hranici stability
   end
end

if(rydz==1)                  % riaditelnost a pozorovatelnost sa urci len pre rydze systemi

% Test riaditelnosti
[A,B,C,D] = tf2ss(cit,men);  % Vypocet stavoveho opisu pre zadany system
if(rank(A)==rank(ctrb(A,B)))
    riad = 1;                % Zadany system je riaditelny
else
    riad = 0;                % Zadany system nie je riaditelny
end

% Test pozorovatelnosti
if(rank(A)==rank(ctrb(A,B)))
    poz = 1;                % Zadany system je pozorovatelny
else
    poz = 0;                % Zadany system nieje pozorovatelny
end

else
    riad=0;
    poz=0;
end

% --- GUI ---%
if(gui==1)
  
  fgcolor=[0.7 0.7 0.7];
    
  if(rydz==0||stab==0||stab==-1||riad==0||poz==0)

       t1='';t2='';t3='';t4=''; 
       
       if(rydz==0)
           t1 = ptg_string(9,17,ptv_str_lang);
       end
       if(stab==0)
           t2 = ptg_string(9,18,ptv_str_lang);
       end
       if(stab==-1)
           t2 = ptg_string(9,19,ptv_str_lang);
       end
       if(riad==0&&rydz==1)       
           t3 = ptg_string(9,20,ptv_str_lang);
       end
       if(poz==0&&rydz==1)       
           t4= ptg_string(9,21,ptv_str_lang);
       end
    
    % ERROR MESSAGE
    
    mess = [ptg_string(9,16,ptv_str_lang),t1,t2,t3,t4];
    mess = mess(1:end-1);
    mess = [mess,'!'];
    kam = ['clear(''mess'');',kam];
    pth_fig = ptg_error(kam,mess,ptv_str_lang);
  end
end