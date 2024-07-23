% PT_HOME
%
%   Function PT_HOME returnes path to the home folder of the input file
%
%   pt_home_path = pt_home(inp)
%
%   juraj.oravec@stuba.sk
%


function pt_home_path = pt_home(inp)

if (nargin == 0)
    inp = 'piddesign.m';
end

% Check input
%
if(exist(inp)==2)
    chk = 1;
else
    chk = 0;
end

% Input file exists
%
if(chk == 1)
    
inp_length = length(inp);

pt_home_path = which(inp);
pt_home_path = pt_home_path(1:end-inp_length);

% Input file does not exists
%
else

pt_home_path = '';

end