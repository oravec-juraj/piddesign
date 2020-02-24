% PTF_PTC_LIST
%
%   Function PTF_PTC_LIST returns vector with list of experimental method
%   suitables for choosen controler type
%
%   ptv_ptc_list = ptf_ptc_list(typ_c)
%
%   where
%
%   typ_c - is variable for choice of the controler type
%      typ_c == 1 for P Controler
%      typ_c == 2 for PI Controler
%      typ_c == 3 for PID Controler
%
%   ptv_ptc_list - is vector of found methods for choosen controler type,
%   this list is usually input for function PTF_PTC_LIST

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


function ptv_ptc_list = ptf_ptc_list(typ_c)

ptv_ptc_list = [];

found = 0;

for i = 1:200

    method = ['ptc_',num2str(i)];

    if(exist(method)==2)

        if(eval([method,'(0,',num2str(typ_c),',-1)']) == 1)
            found = found + 1;
            ptv_ptc_list(found) = i;
        end

    end

end