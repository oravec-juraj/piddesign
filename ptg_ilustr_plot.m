
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

h_ilustr_plot = findobj('Tag','ptt_ilustr_plot');

if (isempty(h_ilustr_plot) == 1)
   
    figure
    set(gcf,'Tag','ptt_ilustr_plot')
    h_ilustr_plot = gcf;
    
end

figure(h_ilustr_plot(1))

if(typ_i == 1)

% Aperiodic
%

ilustr_data = load('ilustr_pch_aper.txt');

ilustr_t = ilustr_data(:,1);
ilustr_y = ilustr_data(:,2);
ilustr_u = ilustr_data(:,3);

subplot(2,1,1)
plot(ilustr_t,ilustr_y,[1.2817+1 2.7183+2],[0 ilustr_y(end)])
axis([0 ilustr_t(end) ilustr_y(1) ilustr_y(end)])
xlabel(ptg_string(10,3,ptv_str_lang))
ylabel(ptg_string(10,4,ptv_str_lang))
title(ptg_string(10,16,ptv_str_lang))

text(0.2,0.05,'y_ 0')
text(9.2,0.9,'y_ Inf')
text(1.8,0.05,'t_ D')
text(2.3,-0.15,'t_ 1')
text(4.7,0.9,'t_ 2')

subplot(2,1,2)
plot(ilustr_t,ilustr_u,'r--')
axis([0 ilustr_t(end) ilustr_u(1)-1 ilustr_u(end)+1])
xlabel(ptg_string(10,3,ptv_str_lang))
ylabel(ptg_string(10,2,ptv_str_lang))

text(0.1,0.1,'u_ 0')
text(1.1,1.1,'u_ Inf')
text(1.1,-0.9,'t_ 0')

set(gcf,'Color','White')


elseif(typ_i == 2)


% Periodic
%

ilustr_data = load('ilustr_pch_per.txt');

ilustr_t = ilustr_data(:,1);
ilustr_y = ilustr_data(:,2);
ilustr_u = ilustr_data(:,3);

subplot(2,1,1)
plot(ilustr_t,ilustr_y)
axis([0 ilustr_t(end) ilustr_y(1) max(ilustr_y)+0.1])
xlabel(ptg_string(10,3,ptv_str_lang))
ylabel(ptg_string(10,4,ptv_str_lang))
title(ptg_string(10,16,ptv_str_lang))

text(0.2,0.05,'y_ 0')
text(4.8,1.1,'y_ Max')
text(8,0.9,'y_ Min')
text(18.8,0.85,'y_ Inf')
text(1.8,0.05,'t_ D')
text(4.8,0.05,'t_ Max')
text(8,0.05,'t_ Min')

subplot(2,1,2)
plot(ilustr_t,ilustr_u,'r--')
axis([0 ilustr_t(end) ilustr_u(1)-1 ilustr_u(end)+1])
xlabel(ptg_string(10,3,ptv_str_lang))
ylabel(ptg_string(10,2,ptv_str_lang))

text(0.1,0.1,'u_ 0')
text(1.1,1.1,'u_ Inf')
text(1.1,-0.9,'t_ 0')

set(gcf,'Color','White')

end

% Return to window of SUS
%
if (isempty(findobj('Tag','ptt_sus')) == 0)
    temp = findobj('Tag','ptt_sus');
    figure(temp(1));
end