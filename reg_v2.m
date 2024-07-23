% REG_V2
%
%   Spusta konkretny skript podla vybraneho typu PID regulatora
%
%   Volane z REG_V



% Preset parameter for SIMUL_PARAM
%
b_w = 1;

typy_ns = ptv_currmethod;

switch ptv_typtm
    case 1          % Experimentalne
        
        switch ptv_typpid
            case 1
                p_param
            case 2
                pi_param
            case 3
                pid_param
            case 4
                pd_param
        end

    case 2          % Analyticke
        
        switch ptv_typpid
            case 1
                p_v_param
            case 2
                pi_v_param
            case 3
                pid_v_param
            case 4
                pd_v_param
        end
end