% PTF_PRESET
%
%   Function PTF_PRESET load the text file PT_PRESET.TXT, where are stored
%   preset values of variables
%
%   [ptv_str_lang,ptv_cfbcg] = ptf_preset(ptv_filename,ptv_action,ptv_preset_load)



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