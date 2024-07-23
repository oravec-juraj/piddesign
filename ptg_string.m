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