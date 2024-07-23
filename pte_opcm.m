

function [zr,ti,td] = pte_opcm(typ_c,K,Tu,Tn,perf,crit)

% PTE_OPCM
%
%   Experimental method for controller tuning by optimal PID controller
%   method
%
%   [zr,ti,td] = pte_opcm(typ_c,K,Tu,Tn,perf,crit)
%
%   where
%
%   typ_c - is variable for choice of the controller type
%      typ_c == 2 for PI Controller
%      typ_c == 3 for PID Controller
%
%   K - is gain of 1st order proces model
%   Tu,Tn - are parameters of identification by Strejc
%
%   perf - is variable for choice of the controller design style
%       perf == 1 for set-point tracking
%       perf == 2 for disturbance rejection
%
%   crit - is variable for choice of the integral criteria
%       crit == 1 for ISE
%       crit == 2 for ITSE
%       crit == 3 for ISTSE

% Table columns:
%
%________________________________________
% Tu/Tn < 1          | Tu/Tn > 1
%________________________________________
% ISE | ITSE | ISTSE | ISE | ITSE | ISTSE
%________________________________________

% PI Tab
%
% Set-point
%
tab2(:,:,1) =[
    0.980,0.712,0.569,1.072,0.786,0.628;
    -0.892,-0.921,-0.951,-0.560,-0.559,-0.583;
    0.690,0.968,1.023,0.648,0.883,1.007;
    -0.155,-0.247,-0.179,-0.114,-0.158,-0.167];
%
% PI Disturbance rejection
%
tab2(:,:,2) =[
    1.279, 1.015, 1.021, 1.346, 1.065, 1.076;
    -0.945,-0.957,-0.953,-0.675,-0.673,-0.648;
    0.535, 0.667, 0.629, 0.552, 0.648, 0.650;
    0.586, 0.522, 0.546, 0.438, 0.427, 0.442];

% PID Tab
%
% Set-point
%
tab3(:,:,1) = [1.048,1.042,0.968,1.154,1.142,1.061;
    -0.897,-0.897,-0.904,-0.567,-0.579,-0.583;
    1.195,0.987,0.977,1.047,0.919,0.892;
    -0.368,-0.238,-0.253,-0.220,-0.172,-0.165;
    0.489,0.385,0.316,0.490,0.384,0.315;
    0.888,0.906,0.892,0.708,0.839,0.832];
%
% Disturbance rejection
%
tab3(:,:,2) = [
    1.473, 1.468, 1.531, 1.524, 1.515, 1.592;
    -0.970,-0.970,-0.960,-0.735,-0.730,-0.705;
    1.115, 0.942, 0.971, 1.130, 0.957, 0.957;
    0.753, 0.725, 0.746, 0.641, 0.598, 0.597;
    0.550, 0.443, 0.413, 0.552, 0.444, 0.414;
    0.948, 0.939, 0.933, 0.851, 0.847, 0.850];
    
%tab_PID_D = [1.260,1.053,0.942,1.295,1.120,1.001; 0.887,0.930,0.933,0.619,0.625,0.624;
%0.701,0.736,0.770,0.661,0.720,0.754; 0.147,0.126,0.130,0.110,0.114,0.116;
%0.375,0.349,0.308,0.378,0.350,0.308; 0.886,0.907,0.897,0.756,0.811,0.813];


if(Tu/Tn > 1)
    
    crit = crit + 3;
    
end

order = ['coef = tab',num2str(typ_c),'(:,crit,perf);'];
eval(order);

zr = coef(1)/K*(Tu/Tn)^(coef(2));
ti = Tn/(coef(3)+coef(4)*(Tu/Tn));

% PI Controller
%
if(typ_c == 2)
    
    td = 0;
    
else
     
% PID Controller
%
    td = coef(5)*Tn*(Tu/Tn)^(coef(6));
    
end