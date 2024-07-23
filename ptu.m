% PTU
%
%   Function PTU enables to Update the PIDDESIGN via internet repository.
%   

%
function ptu()


% Load UPDATE-SETUP Structure
%
fn = 'ptu_setup.mat';
url_source = ['http://cdn.bitbucket.org/oravec/piddesign/downloads/',fn];
url_target = ['.',filesep,fn];
disp(sprintf(' Download: %s',url_source))
try
    chk = urlwrite(url_source,url_target);
    disp(sprintf('\b finished.'))
    setup = load(fn,'-mat');
    setup = setup.setup;
catch
    disp(sprintf('\b failed!'))
    error(' Unable to load UPDATE-SETUP Structure!')
end % try


% Load PT_MYVER to Get Current Value of Version
%
try
    myver = load('pt_myver.txt');
catch
    disp(' Unable to recognize current version using PT_MYVER.TXT!')
    myver = -Inf;
    save pt_myver.txt myver -ascii,
    disp(' Temporary ZERO-Version created!')
end % try


% Counter
%
try
    url_source_cnt = ['http://cdn.bitbucket.org/oravec/piddesign/downloads/piddesign_counter'];
    temp = urlread(url_source_cnt);
catch
    disp(' Unable to download total counter!')
end % try 


% Update
%
chk = inup(setup,myver);

end % function

%%
% INUP
%
%   Function INUP enables to install or update the toolbox via internet repository.
%   

%
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
