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



function ptv_ptc_name = ptf_ptc_names(ptv_ptc_list,ptv_str_lang)

ptv_ptc_name = '';

for i = 1:length(ptv_ptc_list)

    method = ['ptc_',num2str(ptv_ptc_list(i))]

    current_method = (eval([method,'(',num2str(ptv_str_lang),',-1)']))
    ptv_ptc_name = [ptv_ptc_name,current_method,'|'];
end

ptv_ptc_name = ptv_ptc_name(1:end-1);