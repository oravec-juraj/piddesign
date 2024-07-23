

id = load('pt_dlogid.txt');
id = id + 1;
save 'pt_dlogid.txt' id -ascii

% ID
%
dlog.id = id;

% Clock
%
dlog.clock = clock;

% Controller Parameters
%
dlog.zr = z_r;
dlog.ti = t_i;
dlog.td = t_d;
dlog.tr = t_r;
dlog.tf = t_f;
dlog.bw = b_w;

% Controlled Process Parameters
%
dlog.num = C;
dlog.den = M;
dlog.d = Dr;

% Reference parameters
%
dlog.ref1 = W_povodna;
dlog.ref2 = W_nova;
dlog.reftime = W_cas_zmeny;

% Disturbance parameters
%
dlog.dis1 = R_povodna;
dlog.dis2 = R_nova;
dlog.distime = R_cas_zmeny;

% Manipulated variable parameters
%
dlog.mvupper = U_horne_obmedzenie;
dlog.mvlower = U_dolne_obmedzenie;

% Simulation Parameters
%
dlog.simtime = cas_simulacie;
dlog.prec = presnost_riadenia;

% Integral criteria parameters
%
dlog.qu = q_u;
dlog.qdu = q_du;
dlog.qde = q_de;

% Integral criteria
%
dlog.st = setime;
dlog.mo = sigma_Max;
dlog.iae = iae;
dlog.ise = ise;
dlog.itae = itae;
dlog.itse = itse;
dlog.istae = istae;
dlog.istse = istse;
dlog.iseu = ise_u;
dlog.isedu = ise_du;
dlog.isede = ise_de;

% Save file
%
pt_order = ['save ./pt_dlogs/dlog',num2str(id),'.mat -struct dlog'];
eval(pt_order)