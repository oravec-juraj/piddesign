

function ptf_eps(hf,ptv_str_lang)

if (exist('exportfig'))
    
    [meno,adr]=uiputfile('*.*',ptg_string(1,15,ptv_str_lang));

    if meno==0 % kvoli nazvu *.*

    else
    
        exportfig(hf,[adr,meno],'width',5,'fontmode','fixed','fontsize',10,'Color','rgb');
        
    end
        
else
    
    pth_fig = ptg_error('',ptg_string(9,49,ptv_str_lang),ptv_str_lang);

end