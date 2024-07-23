% PTF_PTC_LIST
%
%   Function PTF_PTC_LIST returns vector with list of experimental method
%   suitables for choosen controler type
%
%   ptv_ptc_list = ptf_ptc_list(typ_c)
%
%   where
%
%   typ_c - is variable for choice of the controler type
%      typ_c == 1 for P Controler
%      typ_c == 2 for PI Controler
%      typ_c == 3 for PID Controler
%
%   ptv_ptc_list - is vector of found methods for choosen controler type,
%   this list is usually input for function PTF_PTC_LIST



function ptv_ptc_list = ptf_ptc_list(typ_c)

ptv_ptc_list = [];

found = 0;

for i = 1:200

    method = ['ptc_',num2str(i)];

    if(exist(method)==2)

        if(eval([method,'(0,',num2str(typ_c),',-1)']) == 1)
            found = found + 1;
            ptv_ptc_list(found) = i;
        end

    end

end