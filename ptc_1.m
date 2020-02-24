% PTC_1
%
%   PTC_#num functions are used to tune the controller by various
%   experimental methods 
%
%   PTC_#num function returns
%
%   [zr,ti,td] = ptc_#num(ptv_str_lang,typ_c,n,K,T,D,Tu,Tn) - controller tuning
%
%   [method_name] = ptc_#num(ptv_str_lang,-1) - returns current method name
%
%   [controller_type] = ptc_#num(ptv_str_lang,typ_c,-1) - returns 1 if
%   required controller can be tuned and 0 if required controller cannot be
%   tuned by this method
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 1 for P Controller
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%      typ_c == 4 for PD Controller
%
%   ptv_str_lang - is variable of chosen language
%   n - is order of proces model
%   K - is gain of proces model
%   T - is time constant of proces model
%   D - is time delay
%   Tu,Tn - are parameters of identification by Strejc
%
%   Other functions:
%
%   PTC_1_STR
%
%   PTC_1 return parameters of controller tuned by Strejc method:
%
%   [zr,ti,td] = strejc(ptv_str_lang,typ_c,n,K,T);

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


function [zr,ti,td] = ptc_1(ptv_str_lang,typ_c,n,K,T,D,Tu,Tn)

    % Method Name
    %
    if(typ_c == -1)
        switch ptv_str_lang
            case 1
                zr = 'Strejcova metoda';
            otherwise
                zr = 'Strejc method';
        end
    end

    % Tuned Controllers
    %
    if(n == -1)
        if(typ_c==1||typ_c==2||typ_c==3)    % P, PI, PID
            zr = 1;
        else                                % PD
            zr = 0;
        end
    
    % Checking the proces model
    %
    elseif(nargin > 3)

        if (((typ_c == 2)||(typ_c == 1)) && (n < 2))
            pth_fig = ptg_error(reg_v,ptg_string(1,ptv_str_lang),ptv_str_lang);

        elseif ((typ_c == 3) && (n < 2))
            pth_fig = ptg_error(reg_v,ptg_string(2,ptv_str_lang),ptv_str_lang);

        else
        
    % Controller Tuning
    %
            [zr,ti,td] = strejc(ptv_str_lang,typ_c,n,K,T);
        end
    
    else
    
    % Error
    %
        error('Error using ptc_#num! Not enough input arguments!')
    
    end