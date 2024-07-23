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
ptu_out_default.update = 0;    % Test version

% Input check
%
if (nargin==0)
    ptu_out = ptu_out_default;    % Test version
end
if (nargin==1)&(ptu_opt=='')
    ptu_out = ptu_out_default;    % Test version
end

% Test version
%
ptu_out = ptu_out_default;    % Test version
ptu_out.updateinfo = 'Nothing changed.';