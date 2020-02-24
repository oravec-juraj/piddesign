% PTV_STRING_UIMENU
%
%   Function generates UIMENU with list of languages

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


function pth_uim_str_list = ptf_string_uimenu(pth_uim,ptv_str_list)

for i = 1:length(ptv_str_list)
     i_str = num2str(ptv_str_list(i));
     str = ['pth_uim_str_list = uimenu(pth_uim,''Label'',ptg_string(0,0,',i_str,'),''CallBack'',''ptv_str_lang = ',i_str,';okno''); '];
     eval(str);
end