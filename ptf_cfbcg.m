% ptg_cfbcg
% Colourfull Figure Background

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