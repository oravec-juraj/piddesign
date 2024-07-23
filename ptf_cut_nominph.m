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