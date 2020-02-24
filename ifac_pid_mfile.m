% gr_data.gr2.t=t_sim
% gr_data.gr2.y=y_sim
% gr_data.gr2.tu=t_akc
% gr_data.gr2.u=y1_akc

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


t = gr_data.gr2.t;
y1 = gr_data.gr1.y;
y2 = gr_data.gr2.y;
y3 = gr_data.gr3.y;
y4 = gr_data.gr4.y;
y5 = gr_data.gr5.y;
y6 = gr_data.gr6.y;

u1 = gr_data.gr1.u;
u2 = gr_data.gr2.u;
u3 = gr_data.gr3.u;
u4 = gr_data.gr4.u;
u5 = gr_data.gr5.u;
u6 = gr_data.gr6.u;

% Y_analyt
%
figure
hold on

plot(t,y1,'b--','linewidth',2)
plot(t,y2,'r-.','linewidth',2)
plot(t,y3,'color',[0 0.5 0],'linewidth',2)

ax = axis;
axis([0 20 ax(3) ax(4)])

plot([t(1),t(end)],[1 1],'k:','linewidth',2)
plot([t(1),t(end)],[1*0.95 1*0.95],'k:','linewidth',2)
plot([t(1),t(end)],[1*1.05 1*1.05],'k:','linewidth',2)

% Y_exper
%
hold off
figure
hold on

plot(t,y4,'b--','linewidth',2)
plot(t,y5,'r-.','linewidth',2)
plot(t,y6,'color',[0 0.5 0],'linewidth',2)

ax = axis;
axis([0 20 ax(3) ax(4)])

plot([t(1),t(end)],[1 1],'k:','linewidth',2)
plot([t(1),t(end)],[1*0.95 1*0.95],'k:','linewidth',2)
plot([t(1),t(end)],[1*1.05 1*1.05],'k:','linewidth',2)

% U_analyt
%
hold off
figure
hold on

plot(t,u1,'b--','linewidth',2)
plot(t,u2,'r-.','linewidth',2)
plot(t,u3,'color',[0 0.5 0],'linewidth',2)

ax = axis;
axis([0 20 ax(3) ax(4)])

% U_exper
%
hold off
figure
hold on

plot(t,u4,'b--','linewidth',2)
plot(t,u5,'r-.','linewidth',2)
plot(t,u6,'color',[0 0.5 0],'linewidth',2)

ax = axis;
axis([0 20 ax(3) ax(4)])
