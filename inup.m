% INUP
%
%   Function INUP enables to install or update the toolbox via internet repository.
%   
%   est.:2014.03.10.

% Copyright is with the following author(s):
%
% (c) 2014 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2014 Monika Bakosova, Slovak University of Technology in Bratislava,
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

function chk = inup(setup,myver)

fn = setup.fn;
url_source = setup.url_source;
url_target = setup.url_target;

% Initaila Value of Output
%
chk = 0;

% Version Check
%
if(setup.ver <= myver)
    disp(sprintf(' Available version: %s is not newer than installed version: %s',num2str(setup.ver),num2str(myver)))
    error(sprintf(' Update termined!'))
else
    disp(sprintf(' Available version: %s is newer than installed version: %s',num2str(setup.ver),num2str(myver)))
    reply = input(' Do you want to install update? [Y/n]:','s');
	if isempty(reply)
        reply = 'Y';
	end % if
	if(isequal(reply,'Y') == 0)&(isequal(reply,'y') == 0)
    	error(sprintf(' Update termined by user!'))
	end % if
end % if

% Backup
%
backup_name = ['backup_',datestr(clock,30)];
disp(sprintf(' Creating of backup: %s',[backup_name,'.zip']))
try
    [files,dirs,unknown,hiddenfiles] = sortls();
    backup_files = index_not({backup_name},files);
    chk = zip(backup_name,backup_files);
    if(exist([backup_name,'.zip']) == 0)
        disp(sprintf('\b failed!',[backup_name,'.zip']))
        reply = input(' Do you want to continue anyway? [Y/n]:','s');
        if isempty(reply)
            reply = 'Y';
        end % if
        if(isequal(reply,'Y') == 0)&(isequal(reply,'y') == 0)
            error(sprintf(' Update termined by user!'))
        end % if
    else
        disp(sprintf('\b finished.',[backup_name,'.zip']))
    end % if
catch
    disp(sprintf(' Unable to succesfully create backup: %s!',[backup_name,'.zip']))
    reply = input(' Do you want to continue anyway? [Y/n]:','s');
	if isempty(reply)
        reply = 'Y';
    end % if
    if(isequal(reply,'Y') == 0)&(isequal(reply,'y') == 0)
        error(sprintf(' Update termined by user!'))
    end % if
end % try

% Download
%
disp(sprintf(' Download: %s',url_source))
try
    chk = urlwrite(url_source,url_target);
    disp(sprintf('\b finished.'))
catch
    disp(sprintf('\b failed!'))
    error(sprintf(' Update termined!'))
end % try

% Extract Archive
%
try
    disp(sprintf(' Unzip: %s',fn))
    chk = unzip(fn);
    disp(sprintf('\b finished.'))
    chk = 1;
catch
    disp(sprintf('\b failed!'))
    disp(sprintf(' Update termined!'))
    chk = 0;
end % try

% Reload Backup
%
if(chk == 0)
    if(exist(backup_name) ~= 0)
        disp(sprintf(' There is available backup %s.',backup_name))
        reply = input(' Do you want to reload this backup? [Y/n]:','s');
        if isempty(reply)
            reply = 'Y';
        end % if
        if(isequal(reply,'Y') == 1)|(isequal(reply,'y') == 1)
            try
                chk = unzip(backup_name);
            catch
                error(sprintf(' Unable to reload backup %s!',backup_name))
            end % try
        end % if
    else
        error(sprintf(' There is not available backup %s!',backup_name))
    end % if
end % if

% Execute Required Commands
%
if(isempty(setup.run) == 0)
    disp(sprintf(' %s',setup.run))
    reply = input(' Do you want to execute abovementioned command(s)? [Y/n]:','s');
	if isempty(reply)
        reply = 'Y';
    end % if
    if(isequal(reply,'Y') == 0)&(isequal(reply,'y') == 0)
        error(sprintf(' Execution termined by user!'))
    else
        eval(setup.run);
    end % if
end % if

end % function