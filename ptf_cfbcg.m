% ptg_cfbcg
% Colourfull Figure Background


function ptf_cfbcg(pth_figure,ptv_cfbcg)

if(ptv_cfbcg > 0)

  % Get Figure size
  ptv_figure_size = get(pth_figure,'Position');
  ptv_step = ceil(ptv_figure_size(3)/250);
  
  % Effect
  for i=0:1:250
      
      if(ptv_cfbcg==2)  
        pth_effect = uicontrol(pth_figure,...
          'Style','text',...
          'Position',[i*ptv_step 1 ptv_step ptv_figure_size(4)],...
          'BackgroundColor',[1 i/260 i/260]); % Error Figure
      else
        pth_effect = uicontrol(pth_figure,...
          'Style','text',...
          'Position',[i*ptv_step 0 ptv_step ptv_figure_size(4)],...
          'BackgroundColor',[(250-i)/2000 i/260 1]); % Common Figure 
    end
  end
end