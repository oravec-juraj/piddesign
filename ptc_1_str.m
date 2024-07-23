

function ptv_str = ptc_1_str(ptv_str_num,ptv_str_lang)

ptv_str_lang = num2str(ptv_str_lang);
ptv_str_num = num2str(ptv_str_num);

switch ptv_str_lang
    
    case 1

        switch ptv_str_num
            case 1
                ptv_str = ' R� n mus�by� aspo�2!';
            case 2
                ptv_str = ' R� n mus�by� aspo�3!';
            otherwise
                ptv_str = 'ERROR:PTC_ERROR:STR_NUM';
        end
        
    otherwise
        
        switch ptv_str_num
            case 1
                ptv_str = ' Order n has to be higher than 2!';
            case 2
                ptv_str = ' Order n has to be higher than 3!';
            otherwise
                ptv_str = 'ERROR:PTC_ERROR:STR_NUM';
        end
end