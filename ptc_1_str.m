
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

function ptv_str = ptc_1_str(ptv_str_num,ptv_str_lang)

ptv_str_lang = num2str(ptv_str_lang);
ptv_str_num = num2str(ptv_str_num);

switch ptv_str_lang
    
    case 1

        switch ptv_str_num
            case 1
                ptv_str = ' R� n mus�by� aspo�2!';
            case 2
                ptv_str = ' R� n mus�by� aspo�3!';
            otherwise
                ptv_str = 'ERROR:PTC_ERROR:STR_NUM';
        end
        
    otherwise
        
        switch ptv_str_num
            case 1
                ptv_str = ' Order n has to be higher than 2!';
            case 2
                ptv_str = ' Order n has to be higher than 3!';
            otherwise
                ptv_str = 'ERROR:PTC_ERROR:STR_NUM';
        end
end