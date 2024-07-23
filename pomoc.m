

function pomoc(ptv_str_lang,fgcolor)

if (exist('help.html')~=2)
    pth_fig = ptg_error('',ptg_string(9,5,ptv_str_lang),ptv_str_lang);

else
      web(['file:///' which('help.html')]);
end