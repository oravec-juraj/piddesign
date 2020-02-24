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