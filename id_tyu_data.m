

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
