% PTF_SEMPAH
%
%   Function PTF_SEMPAH returns a color of semaphor background for set value
%
%   ptv_semaph_color = ptf_semaph(ptv_value,ptv_ref, ptv_down, ptv_uppper,ptv_cfbcg)

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


function ptv_semaph_color = ptf_semaph(ptv_value,ptv_ref, ptv_down, ptv_uppper,ptv_cfbcg)

ptv_cfbcg = 1;

if(ptv_cfbcg ==1)

    if((ptv_value/ptv_ref) < ptv_down)
        ptv_semaph_color = 'green';
    elseif((ptv_value/ptv_ref) < ptv_uppper)
        ptv_semaph_color = 'yellow';
    else
        ptv_semaph_color = [1 0.3 0.2];
    end

else
    ptv_semaph_color = [0.7 0.7 0.7];
end