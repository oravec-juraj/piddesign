
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

function [ise,iae,ise_t,ise_u,ise_du,ise_de] = ptf_intkrit(t,e,u,w,Qe,Qu,Qdu)

ise = sum(e.^2);

iae = sum(abs(e));

ise_t = sum(t.*(e.^2));

ise_u = sum((e.^2) + Qu*(u.^2));

e2 = e(1:length(e)-1);

ise_du = sum((e2.^2) + Qu*(diff(u.^2)));

ise_de = sum((e2.^2) + Qe*(diff((e.^2))));