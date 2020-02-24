% PT_HOME
%
%   Function PT_HOME returnes path to the home folder of the input file
%
%   pt_home_path = pt_home(inp)
%
%   juraj.oravec@stuba.sk
%
%   2012.04.17

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