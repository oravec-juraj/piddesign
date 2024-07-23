% PTG_STRING_LIST
%
%   Function generates thelist of accessable language localizations



function ptv_str_list = ptg_string_list

    max = 200; % maximal number of languages
    j = 0;

    for i=0:max
      i_str = num2str(i);
      if(exist(['ptg_string_',i_str])==2)
          j = j + 1;
          ptv_str_list(j) = i;
      end
    end