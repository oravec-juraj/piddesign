% LOG_FILE
%
%   Function LOG_FILE saves names of used m-file into output file.
%
%   chk_file = log_file(input_string,trigger,output_file_name)
%
%   where
%
%   input_string     - is input string.
%                      For example the name of used m-file. To get it,
%                      function MFILENAME can be successfuly used
%   trigger          - is input trigger of function
%                      trigger == 1 to save information
%                      trigger ~= 1 not to save information
%
%   file_name_output - is input name of output file. In case it has been
%                      not set, default value is used:
%                      output_file_name = log_file.txt
%   chk_file         - is output variable of FCLOSE function output
%
%   juraj.oravec@stuba.sk
%
%   2010.11.17.


function chk_file = log_file(input_string,trigger,output_file_name)

% Default file
%
if (nargin < 3)

    output_file_name = 'log_file.txt';
    
end

% Store data into log_file
%
if (trigger == 1)|(nargin == 1)
    
    % Creating file in case it does not exit yet
    %
    if(exist(output_file_name)==0)
    
        file_name_temp = output_file_name;
        output_file_name = [which('pt')];
        output_file_name = output_file_name(1:end-4);
        output_file_name = [output_file_name,file_name_temp];
        save output_file_name -ascii
    
    end
    
    % Get current time
    %
    log_clock = clock;

    % Get current m-file
    %
    log_f = fopen(output_file_name,'a');
    fprintf(log_f,'\n%4.0f.%2.0f.%2.0f\t%2.0f:%2.0f:%2.6f\t\t%s\t\t%s\t\t%s',log_clock,input_string,home_folder('pt'),which(output_file_name));
    chk_file = fclose(log_f);
    
end