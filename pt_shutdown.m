% pt_shutdown
%


close all

% Store values preset by user
%
ptf_preset('pt_preset.txt',1,[ptv_ws_store;ptv_str_lang;ptv_cfbcg]);


% Load stored WorkSpace variables
%
if(exist('ptv_ws_store') == 1 )
    if(ptv_ws_store == 1)
        
        clear
        
        try
            load pt_ws.dat -mat
        catch
            % Chybova hlaska
        end
    end
end
