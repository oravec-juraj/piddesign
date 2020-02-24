
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