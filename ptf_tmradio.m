% Tunning method

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

function ptv_typtm = ptf_tmradio(pth_rad,typ_i,ptv_str_lang)

    ptv_typtm = get(pth_rad,'Tag');
    
    ptv_typtm = ptv_typtm(end);

    set(pth_rad,'Value',1);
    
    % Deactive unchcked radiobuttons
    if(ptv_typtm~='1')
        set(findobj('Tag','ptt_radio_tm1'),'Value',0);
    end

    if(ptv_typtm~='2')
        set(findobj('Tag','ptt_radio_tm2'),'Value',0);

        if(typ_i==2)
            ptv_typtm = '2';
            close
            pth_fig = ptg_error('reg_v',ptg_string(9,23,ptv_str_lang),ptv_str_lang);
        end

    end

    ptv_typtm = str2num(ptv_typtm);