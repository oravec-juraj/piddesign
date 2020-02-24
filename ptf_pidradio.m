
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

function ptv_typpid = ptf_pidradio(pth_rad)

    % Check which radiobutton has been choosen
    %
    ptv_typpid = get(pth_rad,'Tag');
    %    
    ptv_typpid = ptv_typpid(end);
    %
    set(pth_rad,'Value',1);
    
    % Deactive unchcked radiobuttons
    if(ptv_typpid~='1')
        set(findobj('Tag','ptt_radio_pid1'),'Value',0);
    end
    
    if(ptv_typpid~='2')
        set(findobj('Tag','ptt_radio_pid2'),'Value',0);
    end
    
    if(ptv_typpid~='3')
        set(findobj('Tag','ptt_radio_pid3'),'Value',0);
    end
    
    if(ptv_typpid~='4')
        set(findobj('Tag','ptt_radio_pid4'),'Value',0);
    end

    ptv_typpid = str2num(ptv_typpid);

% Text effect
ptf_choosenpid(ptv_typpid);