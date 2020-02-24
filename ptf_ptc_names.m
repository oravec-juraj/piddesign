% PTF_PTC_NAMES
%
%   Function PTF_PTC_NAMES returns string with list of names of experimental method
%   suitables for choosen controler type
%   This string is suitable for uicontrol POPUP
%
%   ptv_ptc_name = ptf_ptc_names(ptv_ptc_list,ptv_str_lang)
%
%   where
%
%   ptv_ptc_list - is vector of found methods for choosen controler type,
%   this list is usually returned by function PTF_PTC_LIST
%
%   ptv_str_lang - is variable of language type
%
%
%   For direct usage of both functions:
%
%   ptv_ptc_name = ptf_ptc_names(ptf_ptc_list(typ_c),ptv_str_lang)

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


function ptv_ptc_name = ptf_ptc_names(ptv_ptc_list,ptv_str_lang)

ptv_ptc_name = '';

for i = 1:length(ptv_ptc_list)

    method = ['ptc_',num2str(ptv_ptc_list(i))]

    current_method = (eval([method,'(',num2str(ptv_str_lang),',-1)']))
    ptv_ptc_name = [ptv_ptc_name,current_method,'|'];
end

ptv_ptc_name = ptv_ptc_name(1:end-1);