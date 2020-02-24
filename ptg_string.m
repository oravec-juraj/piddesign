% PTG_STRING    (2010.02.10)
%
%   ptv_str = ptg_string(ptv_str_cat,ptv_str_num,ptv_str_lang)
%
%   ptv_str = output string
%   ptv_str_cat = input category of string
%   ptv_str_num = input number of string
%   ptv_str_lang = input selection of language for output string
%
%   GUI function PTG_STRING returns required string for GUI figures and
%   uicontrol objects

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


function ptv_str = ptg_string(ptv_str_cat,ptv_str_num,ptv_str_lang)

  if(nargin==2)  % In case PTV_STR_LANG is not inserted, english is set as default language
      ptv_str_lang = 0;
  end

  ptv_str_lang = num2str(ptv_str_lang);

  if(exist(['ptg_string_',num2str(ptv_str_lang)])==2)
      eval(['ptv_str = ptg_string_',num2str(ptv_str_lang),'(ptv_str_cat,ptv_str_num);'])
  else
      ptv_str = ptg_string_0(ptv_str_cat,ptv_str_num);  % In case required language function cannot be found, english is used as default language
  end