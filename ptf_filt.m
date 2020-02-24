% PTF_FILT
%
%   Function PTF_FILT is used to filteration data loaded from data file
%
%   [y_fil,b,a] = ptf_filt(y_orig,fil_name,fil_type,fil_style,order,r,omega)

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


function [y_fil,b,a] = ptf_filt(y_orig,fil_name,fil_type,fil_style,order,r,omega)

typfil = [fil_name,fil_type,fil_style];

% Counting filter parameters
%
if(typfil(1)==1&&typfil(2)==1)
    [b,a]=fir1(order,omega);
elseif(typfil(1)==1&&typfil(2)==2)
    [b,a]=fir1(order,omega,'high');
elseif(typfil(1)==1&&typfil(2)==3)
    [b,a]=fir1(order,omega,'stop');    

elseif(typfil(1)==2&&typfil(2)==1)
    [b,a]=butter(order,omega);
elseif(typfil(1)==2&&typfil(2)==2)
    [b,a]=butter(order,omega,'high');
elseif(typfil(1)==2&&typfil(2)==3)
    [b,a]=butter(order,omega,'stop');  
    
elseif(typfil(1)==3&&typfil(2)==1)
    [b,a]=cheby1(order,r,omega);
elseif(typfil(1)==3&&typfil(2)==2)
    [b,a]=cheby1(order,r,omega,'high');
elseif(typfil(1)==3&&typfil(2)==3)
    [b,a]=cheby1(order,r,omega,'stop');    
    
elseif(typfil(1)==4&&typfil(2)==1)
    [b,a]=cheby2(order,r,omega);
elseif(typfil(1)==4&&typfil(2)==2)
    [b,a]=cheby2(order,r,omega,'high');
elseif(typfil(1)==4&&typfil(2)==3)
    [b,a]=cheby2(order,r,omega,'stop');  
    
elseif(typfil(1)==5&&typfil(2)==1)
    [b,a]=ellip(order,r(1),r(2),omega);
elseif(typfil(1)==5&&typfil(2)==2)
    [b,a]=ellip(order,r(1),r(2),omega,'high');
elseif(typfil(1)==5&&typfil(2)==3)
    [b,a]=ellip(order,r(1),r(2),omega,'stop');
    
    
end

% Filter type - SIMPLE
if(typfil(3)==1)
       
%         % Bez pociatocnych podmienok:
%         y_fil=filter(b,a,y_orig);

        % Pociatocne podmienky pre prikaz FILTER:
        pp=filtic(b,a,y_fil,y_orig);
        y_fil=filter(b,a,y_orig,pp);

% Filter type - IMPROVED
else
        
    % Test, ci je splnena podmienka, ze dlzka vektora y_orig vacsia ako
    % trojnasobok radu filtra

    if(length(y_orig)<=(3*max(length(b)-1,length(a)-1)))
        pth_fig = ptg_error('filtracia',ptg_string(9,34,ptv_str_lang),ptv_str_lang);

    else
        y_fil=filtfilt(b,a,y_orig);
    end
end