% PTF_CUT_NOMINPH
%
%   Function PTF_CUT_NOMINPH modifies signal for easier identification by
%   Strejc
%
%   yn = ptf_cut_nominph(yo)
%
%   where
%   yo is original signal of step response and
%   yn is returned modified signal

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


function yn = ptf_cut_nominph(yo)
    
    % Check the gain sign
    %
    if(yo(end) < yo(1))
        sgn_gain = -1;
    else
        sgn_gain = 1;
    end

    % Normalise the signal yo for positive gain
    %
    yo = yo*sgn_gain;

    % Cut off the non-minimal phase
    %
    k = length(yo);
    
    while(yo(k) > yo(1))
        yn(k) = yo(k);
        k = k - 1;
    end

    % Return original gain sign
    %
    yn = (yn*sgn_gain)';