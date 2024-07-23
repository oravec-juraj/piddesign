% PTG_PLOT_CHECK
%
%   Volane z SIMUL_P
%   Vykresluje graficky priebeh akcnej veliciny U
%   Dava moznost zobrazit legendu alebo mriezku



function ptg_plot_check(ptv_plot_leg,ptv_plot_gri,ptv_plot,ptv_plot_inf,ptv_leg,ptv_str_lang)

for j = 1 : length(ptv_plot)-1
    x = ptv_plot{j};
    c = ptv_plot{end};
    
    for k = 2 : size(x,2)
        
        if(size(x,2) >2 )
            if(k-1 > length(c)) % Ak bol presiahnuty rozsah "c", daj poslednu hodnotu
                style = c{end};
            else
                style = c{k-1};
            end
        else
            style = c{j};
        end
        
        plot(x(:,1),x(:,k),style)
        hold on
        
    end
    
end
hold off

title(ptg_string(10,ptv_plot_inf(1),ptv_str_lang))
xlabel(ptg_string(10,ptv_plot_inf(2),ptv_str_lang))
ylabel(ptg_string(10,ptv_plot_inf(3),ptv_str_lang))  

if(ptv_plot_leg)
    
    ptv_temp_leg ='legend(';

    for i=1:length(ptv_leg)
        
        if(ptv_leg(i)==-1)  % Check for line
            points = ptv_plot{i};
            ptv_temp_leg = [ptv_temp_leg,'''',ptf_line(points(:,1),points(:,2)),''','];            
        else
            ptv_temp_leg = [ptv_temp_leg,'''',ptg_string(10,ptv_leg(i),ptv_str_lang),''','];
        end
    end
    
    ptv_temp_leg = ptv_temp_leg(1:end-1);
    ptv_temp_leg = [ptv_temp_leg,')'];
    
    eval(ptv_temp_leg);

end

if(ptv_plot_gri)
    
    grid on
    
else
    
    grid off
    
end
