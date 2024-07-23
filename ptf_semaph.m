% PTF_SEMPAH
%
%   Function PTF_SEMPAH returns a color of semaphor background for set value
%
%   ptv_semaph_color = ptf_semaph(ptv_value,ptv_ref, ptv_down, ptv_uppper,ptv_cfbcg)



function ptv_semaph_color = ptf_semaph(ptv_value,ptv_ref, ptv_down, ptv_uppper,ptv_cfbcg)

ptv_cfbcg = 1;

if(ptv_cfbcg ==1)

    if((ptv_value/ptv_ref) < ptv_down)
        ptv_semaph_color = 'green';
    elseif((ptv_value/ptv_ref) < ptv_uppper)
        ptv_semaph_color = 'yellow';
    else
        ptv_semaph_color = [1 0.3 0.2];
    end

else
    ptv_semaph_color = [0.7 0.7 0.7];
end