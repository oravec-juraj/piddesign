% Tunning method list

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

function ptv_pop_tmlist = ptf_pop_tmlist(ptv_typpid,ptv_typtm,ptv_str_lang)


    % --- Experimenthal methods ---
    %
    % Exp. P reg
    if(ptv_typpid == 1 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,1,ptv_str_lang);
    end
    %
    % Exp. PI reg
    if(ptv_typpid == 2 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,2,ptv_str_lang);
    end
    %
    % Exp. PID reg
    if(ptv_typpid == 3 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,3,ptv_str_lang);
    end
    %
    % Exp. PD reg
    if(ptv_typpid == 4 && ptv_typtm == 1)
        ptv_pop_tmlist = ptg_string(11,4,ptv_str_lang);
    end
    %
    % --- Analythical methods ---
    %
    % Ana. P reg
    if(ptv_typpid == 1 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,5,ptv_str_lang);
    end
    %
    % Ana. PI reg
    if(ptv_typpid == 2 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,6,ptv_str_lang);
    end
    %
    % Ana. PID reg
    if(ptv_typpid == 3 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,7,ptv_str_lang);
    end
    %
    % Ana. PD reg
    if(ptv_typpid == 4 && ptv_typtm == 2)
        ptv_pop_tmlist = ptg_string(11,8,ptv_str_lang);
    end