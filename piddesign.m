% PIDDESIGN
%
%   PIDDESIGN je uvodny skript programu PIDESIGN
%
%   Spusta - OKNO
%



% Preset values of variables loaded from text file 
%
[ptv_ws_store] = ptf_preset('pt_preset.txt',0);

if(ptv_ws_store == 1)
    clear ptv_ws_store
    save pt_ws.dat -mat
end
    
% BASIC START
%
clear
clc

% LOG
%
input_string = mfilename; log_file(input_string,1);

% Preset values of variables loaded from text file 
%
[ptv_ws_store,ptv_str_lang,ptv_cfbcg] = ptf_preset('pt_preset.txt',0);

% Premenna, ktora urci, ci maju mat figures zobrazeny menubar (none)
ptv_fig_menubar = 'none';
%
% Premenna, ktora urci, ze v REG_V je prednastaveny PI regulator
ptv_typpid = 2;
%
% Premenna, ktora urci, ze v REG_V su prednastavene experimentalne metody
ptv_typtm = 1;

% "Seda" farba pozadia textovych poli:
fgcolor=[.7,.7,.7];

% % Premenna RUN indikujuca start
% % Zmeni na hodnotu nula, ak sa spusti IDENTIFIKACIA, SYNTEZA REGULATORA, SIMUL_PARAM, FILTRACIA v OKNO
% run = 1;

% Premenna J1, ktora zabezpeci, ze sa nebude dat spustit identifikacia, alebo
% ine zadavanie parametrov n,K,T,D,Tu,Tn, ked uz bola raz spustena synteza
% regulatora - REG
J1=0;

%--- PREDNASTAVENE HODNOTY PARAMETROV --------------------------------

% typy metod syntezy regulatora REG_V
ptv_currmethod = 1;     

% typ vstupu identifikovaneho prenosu pre NA_MODEL, POROVNAT
typ_id=1;

% typ vstupu regulovaneho prenosu pre PARAM_VL2, SUS
typ_i=1;

u_0=0;
u_nek=1;
y_max='???';
y_min='???';
y_0=0;
y_nek=1;
t0=0;
t_D=0;
t1='???';
t2='???';
krok=0.01;
cas_simulacie = 50;

% Definovanie otlackovych prednastavenych premennych Q

% Pre vlastne parametre - PARAM_VL

global n K T D Tu Tn

n ='???';
K='???';
T='???';
D='???';

Tu='???';
Tn='???';

% Pre normalizaciu - NORMALIZACIA
delta_u=1;
t0=0;

% Simulacne parametre pre testovanie regulatora - SIMUL_PARAM
%
W_povodna =1;
W_nova =1;
W_cas_zmeny =0;

R_povodna =0;
R_nova =0;
R_cas_zmeny =0;

q_u = 1;
q_du = 1;
q_de = 1;

presnost_riadenia = 0.05;
U_dolne_obmedzenie = -50;
U_horne_obmedzenie = 50;

z_r='???';
t_i='???';
t_d='???';

b_w = 1;

t_f = 0;

Dr ='???';

t_r=0; % pre ANTI-RESET WIND UP

% Simulacny krok
%
ptv_sim_step = 0.01;

% Parametre vykreslenia grafickych priebehov simulacie kvality riadenia - SIMUL_P
Qcheck_uL=1;
Qcheck_uG=0;
Qcheck_yL=1;
Qcheck_yG=0;

% Parametre filtracie - FILTRACIA
%
typfil_1=2;
typfil_2=1;
typfil_3=2;
typfil=[2 1 2];
rad_filtracie ='???';
omega='???';
zvlnenie=0.5;

% Parametre pre nacitanie datoveho suboru - CITSUB
datasub='???';

% Pre vlastne parametre - PARAM_MUP
ksi0 =1;
w0=-1;

% Pre identifikaciu - NA_MODEL
T_km='???';
ksi_km='???';
D_km='???';

% Pre identifikaciu - NA_MODEL2
cit = '???';
men = '???';

% Prametre pre PI_PARAM a PID_PARAM pre Met. zal. na bezp. vo faze a v ampl.
Gm = 4;
Pm = 60;

%--- Koniec PREDNASTAVENE HODNOTY PARAMETROV ---------------------------
okno