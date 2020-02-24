
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

xlabel('time')

ylabel('y(t) (solid line), u(t) (dashed line)')
ylabel('y_{N0}(t) (solid line), y_N(t) (dashed line)')
ylabel('y_{ID}(t), y_{N0}(t)')
ylabel('y_{F}(t), y_{N0}(t)')
ylabel('y_{ID}(t), y_{F}(t)')
ylabel('Comparison')
ylabel('y(t)')
ylabel('u(t)')
title('')
set(findobj('style','check'),'visible','off')
set(findobj('style','push'),'visible','off')
set(findobj('style','text'),'visible','off')
set(findobj('style','slider'),'visible','off')

use_exportfig