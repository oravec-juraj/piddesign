% PTF_FILT
%
%   Function PTF_FILT is used to filteration data loaded from data file
%
%   [y_fil,b,a] = ptf_filt(y_orig,fil_name,fil_type,fil_style,order,r,omega)



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