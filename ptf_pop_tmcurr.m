

function ptf_pop_tmcurr(ptv_typpid,ptv_typtm,ptv_currmethod,ptv_str_lang)
    set(findobj('Tag','ptt_popup_tm'),'String',ptf_pop_tmlist(ptv_typpid,ptv_typtm,ptv_str_lang));
 
    set(findobj('Tag','ptt_popup_tm'),'Value',1);
    
%     % How much methods are offen
%     %
%     countmethods = size(get(findobj('Tag','ptt_popup_tm'),'String'));
%     countmethods = countmethods(1);
%     %
%     if (ptv_currmethod <= countmethods)
%         set(findobj('Tag','ptt_popup_tm'),'Value',ptv_currmethod);
%     end