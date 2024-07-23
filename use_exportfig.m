% parametre pomeru velkost_pisma/velkost_obrazku
% vhodne pre linux


fs = 5;
fz = 10;

% % vhodne pre windows
% fs = 9;
% fz = 10;

% rozdiel v nastaveniach je asi sposobeny rozdielnymi fontami


exportfig(gcf,'plot_t.eps','width',fs,'fontmode','fixed','fontsize',fz,'color','rgb');
