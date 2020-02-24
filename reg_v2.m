% REG_V2
%
%   Spusta konkretny skript podla vybraneho typu PID regulatora
%
%   Volane z REG_V

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


% Preset parameter for SIMUL_PARAM
%
b_w = 1;

typy_ns = ptv_currmethod;

switch ptv_typtm
    case 1          % Experimentalne
        
        switch ptv_typpid
            case 1
                p_param
            case 2
                pi_param
            case 3
                pid_param
            case 4
                pd_param
        end

    case 2          % Analyticke
        
        switch ptv_typpid
            case 1
                p_v_param
            case 2
                pi_v_param
            case 3
                pid_v_param
            case 4
                pd_v_param
        end
end