

function [y_norm,t_norm] = normalisation(y,du,t)

y_norm = y - y(1);
y_norm = y_norm/du;
t_norm = t - t(1);