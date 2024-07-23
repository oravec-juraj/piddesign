% PTU_CMD
%
%   Function PTU_CMD enables to update the software PIDDESIGN.
%
%   juraj.oravec@stuba.sk
%
%   2012.04.17


function ptu_out = ptu_cmd(ptu_opt)

% Default options
%
if (nargin==0)
    ptu_opt     = 0;    % Test version
end

% Test version
%
ptu_out.info = 'Nothing changed.';