
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

function [n,K,T,D,Tu,Tn] = id_tyu_data(t,y,u)

[ind_du, du, length_u] = find_du(u);

t0 = t(ind_du);

y0 = y(ind_du);


for w = 1 : length(du)
    
    y_id = y(ind_du(w) : ind_du(w+1));
    t_id = t(ind_du(w) : ind_du(w+1));
    [y_norm,t_norm] = normalisation(y_id,du(w),t_id);
    Y_norm(:,w) = y_norm(1 : min(length_u));
   
end

hold off

y_norm = mean(Y_norm')';

t_norm = t_norm(1 : min(length_u));

[n,K,T,D,Tu,Tn] = ptf_strejc(y_norm,t_norm);
