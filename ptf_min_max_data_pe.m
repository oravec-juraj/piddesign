

function [y_max, y_min, t_max, t_min, t_d] = ptf_min_max_data_pe(t,y)

% Signum of the Values
%
if(y(end) > 0)
    y_sgn = 1;
else
    y_sgn = -1;
end
%
% To Ensure Correct Min-Max Values
%
y = abs(y);

% Maximum of the Step Response
%
y_max = max(y);
y_max = y_max(1);
index_y_max = find(y_max == y);
index_y_max = index_y_max(1);
y_max = y_max*y_sgn;
t_max = t(index_y_max);

% Minimum of the Step Response
%
y_min = min(y(index_y_max:end));
y_min = y_min(1);
index_y_min = find(y_min == y);
index_y_min = index_y_min(1);
y_min = y_min*y_sgn;
t_min = t(index_y_min);

% Approximation of the Time Delay
%
gain = y(end);
toler = gain/200;
index_t_d = find(toler < y);
index_t_d = index_t_d(1);
t_d = t(index_t_d);
%
% Check the Validity of the T_D
%
if(t_max < t_d)
    t_d = 0; % Initial value of T_D
end