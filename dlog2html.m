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

function chk_fclose = dlog2html(dlog_name,dlog_id,ptv_str_lang,show)

% Initialize HTML file
%
dlog_f = fopen(dlog_name,'w');
% 
% fprintf(dlog_f,'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
% fprintf(dlog_f,'<html xmlns="httpwww.w3.org/1999/xhtml" xml:lang="sk" lang="sk">');

fprintf(dlog_f,'<html>\n<head>\n<meta http-equiv=''content-type'' content=''text/html; charset=utf-8'' />\n</head><title>pt</title>\n<body>');
fprintf(dlog_f,'<table border=1 align=''center''>\n');

% Name of table data
%
fprintf(dlog_f,'<tr>\n');

% ID
%
fprintf(dlog_f,'<th>id</th>');

% Clock
%
fprintf(dlog_f,'<th>%s</th>',ptg_string(7,15,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>',ptg_string(7,16,ptv_str_lang));

% Controller parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,10,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,11,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,12,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,13,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,59,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,58,ptv_str_lang));

% Controlled Process Parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,14,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,15,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,4,ptv_str_lang));

% Reference parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,16,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,17,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,18,ptv_str_lang));

% Disturbance parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,19,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,20,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,21,ptv_str_lang));

% Manipulated variable parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,25,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,24,ptv_str_lang));

% Simulation Parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,23,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,22,ptv_str_lang));

% Integral criteria parameters
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,26,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,27,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,28,ptv_str_lang));

% Integral criteria
%
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,53,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,54,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,41,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,42,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,43,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,55,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,56,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,57,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,44,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,45,ptv_str_lang));
fprintf(dlog_f,'<th>%s</th>\n',ptg_string(8,46,ptv_str_lang));



% Finalize table name
%
fprintf(dlog_f,'</tr>\n');


% ----------------------------------------------- %



% Controller Parameters
%
for n = 1 : dlog_id

    if(exist(['./pt_dlogs/dlog',num2str(n),'.mat'])==2)
        
    dlog = load(['./pt_dlogs/dlog',num2str(n),'.mat']);
    fprintf(dlog_f,'<tr>\n');

    % ID
    %
    fprintf(dlog_f,'<td>%s</td>',num2str(dlog.id));

    % Clock
    %
    fprintf(dlog_f,'<td>%4.0f.%2.0f.%2.0f</td><td>%2.0f:%2.0f:%2.6f</td>',dlog.clock);

    % Controller parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.zr));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.ti));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.td));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.tr));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.tf));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.bw));
    
    % Controlled Process Parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.num));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.den));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.d));
    
    % Reference parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.ref1));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.ref2));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.reftime));
    
    % Disturbance parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.dis1));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.dis2));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.distime));
    
    % Manipulated variable parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.mvupper));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.mvlower));
    
    % Simulation Parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.simtime));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.prec));

    % Integral criteria parameters
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.qu));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.qdu));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.qde));

    % Integral criteria
    %
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.st));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.mo));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.iae));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.ise));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.itae));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.itse));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.istae));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.istse));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.iseu));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.isedu));
    fprintf(dlog_f,'<td>%s</td>\n',num2str(dlog.isede));
    
    fprintf(dlog_f,'</tr>\n');

    % END of check dlog(n).mat EXIST
    %
    end
    
end

% Finalize HTML file
%
fprintf(dlog_f,'</table>\n');
fprintf(dlog_f,'</body>\n</html>');
    
chk_fclose = fclose(dlog_f);

if(show == 1)
    
    web(dlog_name);
    
end
