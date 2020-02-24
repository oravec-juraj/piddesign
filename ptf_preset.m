% PTF_PRESET
%
%   Function PTF_PRESET load the text file PT_PRESET.TXT, where are stored
%   preset values of variables
%
%   [ptv_str_lang,ptv_cfbcg] = ptf_preset(ptv_filename,ptv_action,ptv_preset_load)

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


function [ptv_ws_store,ptv_str_lang,ptv_cfbcg] = ptf_preset(ptv_filename,ptv_action,ptv_preset_load)

% PTV_ACTION is a variable for choice of action:
% PTV_ACTION == 0 for loading
% PTV_ACTION == 1 for saving

% Loading from text file
%
if (ptv_action == 0)
    
    % Checking if exists required text file
    %
    if(exist(ptv_filename)==2)

        % Loading preset values from text file
        %
        ptv_preset_load = load(ptv_filename);

    else
        % In case text file was not found, function PTF_PRESET creates new text
        % file with new values, which will be also returned by this function 
        %
        ptv_preset_load = [1;0;0];
        save(ptv_filename,'ptv_preset_load','-ascii')
    
    end

    % Returning preset values
    %
    ptv_ws_store = ptv_preset_load(1);
    ptv_str_lang = ptv_preset_load(2);
    ptv_cfbcg = ptv_preset_load(3);
    


else

    % Saving preset values of vvariables into text file
    % where variable PTV_PRESET_LOAD is a vector of preset values of
    % variables
    %
    save(ptv_filename,'ptv_preset_load','-ascii')

end