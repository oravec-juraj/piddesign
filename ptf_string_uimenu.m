% PTV_STRING_UIMENU
%
%   Function generates UIMENU with list of languages



function pth_uim_str_list = ptf_string_uimenu(pth_uim,ptv_str_list)

for i = 1:length(ptv_str_list)
     i_str = num2str(ptv_str_list(i));
     str = ['pth_uim_str_list = uimenu(pth_uim,''Label'',ptg_string(0,0,',i_str,'),''CallBack'',''ptv_str_lang = ',i_str,';okno''); '];
     eval(str);
end