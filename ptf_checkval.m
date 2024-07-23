% PTF_CHECKVAL
%
%   Function PTF_CHECKVAL returns value of checkbox, which has set value
%   Tag
%
% ptv_chv = ptf_checkval(ptv_tag)



function ptv_chv = ptf_checkval(ptv_tag)
    ptv_chv = findobj('Tag',ptv_tag);
    if (length(ptv_chv)>1)
        ptv_chv = ptv_chv(1);
    end
    ptv_chv = get(ptv_chv,'Value');