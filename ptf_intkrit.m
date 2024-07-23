

function [ise,iae,ise_t,ise_u,ise_du,ise_de] = ptf_intkrit(t,e,u,w,Qe,Qu,Qdu)

ise = sum(e.^2);

iae = sum(abs(e));

ise_t = sum(t.*(e.^2));

ise_u = sum((e.^2) + Qu*(u.^2));

e2 = e(1:length(e)-1);

ise_du = sum((e2.^2) + Qu*(diff(u.^2)));

ise_de = sum((e2.^2) + Qe*(diff((e.^2))));