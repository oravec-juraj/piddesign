% PTG_STRING_0
%
%   ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num)
%
%   ptv_str = output string
%   ptv_str_cat = input category of string
%   ptv_str_num = input number of string
%
%   GUI function PTG_STRING_0 is called from PTF_STRING
%   PTG_STRING_0 returns required string for GUI figures and uicontrol
%   objects in English



function ptv_str=ptg_string_0(ptv_str_cat,ptv_str_num)

switch ptv_str_cat

    % LANGUAGE
    case 0
        switch ptv_str_num
            otherwise
                ptv_str = 'EN - English';
        end

    % GUI FIGURE TITLE STRING
    %
    case 1
    
          switch ptv_str_num
              case 1
                  ptv_str = 'PIDDESIGN';
              case 2
                  ptv_str = 'Controller tuning';    
              case 3
                  ptv_str = 'Identification';
              case 4
                  ptv_str = 'Setup';                  
              case 5
                  ptv_str = 'Process Model';
              case 6
                  ptv_str = 'Error!';
              case 7
                  ptv_str = 'Warning!';
              case 8
                  ptv_str = 'Control Performance';
              case 9
                  ptv_str = 'Step Response Data';
              case 10
                  ptv_str = 'Quality Criteria';
              case 11
                  ptv_str = 'Load the Data File';
              case 12
                  ptv_str = 'Normalization';
              case 13
                  ptv_str = 'Data Processing';
              case 14
                  ptv_str = 'Filtration';
              case 15
                  ptv_str = 'Save the Data File';
              case 16
                  ptv_str = 'Comparison';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
          end

    % GUI TEXT STRING
    %
    case 2
        
          switch ptv_str_num
              case 1
                  ptv_str = 'In case "Shut down" and "Reset" all the variables will be deleted and all figures will be closed!';
              case 2
                  ptv_str = ' If you really want to set new parameters of the transfer function all figures will be closed!';
              case 3
                  ptv_str = ' PIDDESIGN is already running!';
              case 4
                  ptv_str = 'PID Controller Parameters:';
              case 5
                  ptv_str = 'Process Model:';
              case 6
                  ptv_str = 'Setpoint w(t):';
              case 7
                  ptv_str = 'Disturbance r(t):';
              case 8
                  ptv_str = 'Simulation Parameters:';
              case 9
                  ptv_str = 'Integral Criteria Parameters:';
              case 10
                  ptv_str = ' Identification Error:';
              case 11
                  ptv_str = ' Step Response';
              case 12
                  ptv_str = 'Step Time and Step Change:';
              case 13
                  ptv_str = ' Filter type';
              case 14
                  ptv_str = ' Data file has been sucessfully saved!';
              case 15
                  ptv_str = ' Process model type';
              case 16
                  ptv_str = ' Parameters of the process model:';
              case 17
                  ptv_str = ' Required lower order n_lower:';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI BUTTON STRING
    %
    case 3
        
          switch ptv_str_num
              case 1
                  ptv_str = 'OK';
              case 2
                  ptv_str = 'Back';
              case 3
                  ptv_str = 'Controller Tuning';  
              case 4
                  ptv_str = 'Identification';                  
              case 5
                  ptv_str = 'Setup';
              case 6
                  ptv_str = 'Shut Down';
              case 7
                  ptv_str = 'Reset';
              case 8
                  ptv_str = 'Close Graphs';
              case 9
                  ptv_str = 'Help';
              case 10
                  ptv_str = 'Step Response';
              case 11
                  ptv_str = 'Get Transfer Function';
              case 12
                  ptv_str = 'Step Response Data';
              case 13
                  ptv_str = 'Load the Data File';
              case 14
                  ptv_str = 'Process Model Data';
              case 15
                  ptv_str = '1st Order System';
              case 16
                  ptv_str = 'n-th Order System';
              case 17
                  ptv_str = 'Comparison';
              case 18
                  ptv_str = 'Get lower order model';
              case 19
                  ptv_str = 'Normalization';
              case 20
                  ptv_str = 'Filtration';
              case 21
                  ptv_str = 'Save';
              case 22
                  ptv_str = 'Compare';
              case 23
                  ptv_str = 'Cancel';
              case 24
                  ptv_str = 'Identification Tuning';
              case 25
                  ptv_str = 'Prec+';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI POPUP STRING
    %
    case 4
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Transfer function by Strejc | Damped periodic transfer function';
              case 2
                  ptv_str = ' Aperiodic | Damped Periodic';
              case 3
                  ptv_str = 'FIR|IIR - Butterworth|IIR - Chebyshev|IIR - Chebyshev inv.|IIR - eliptical';
              case 4
                  ptv_str = 'lowpass|highpass|bandstop';
              case 5
                  ptv_str = 'simple|improved';
              case 6
                  ptv_str = ' General transfer function | Aperiodic | Damped Periodic';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI CHECKBOX STRING
    %
    case 5
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Legend';
              case 2
                  ptv_str = ' Grid';
              case 3
                  ptv_str = ' Periodic process';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI RADIOBUTTON STRING
    %
    case 6
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Experimental methods';
              case 2
                  ptv_str = ' Analytical methods';
              case 3
                  ptv_str = ' P';
              case 4
                  ptv_str = ' PI';
              case 5
                  ptv_str = ' PID';
              case 6
                  ptv_str = ' PD';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI UIMENU STRING
    %
    case 7
        
          switch ptv_str_num
              case 1
                  ptv_str = 'PIDDESIGN';
              case 2
                  ptv_str = 'Language';
              case 3
                  ptv_str = 'Controller tuning';  
              case 4
                  ptv_str = 'Identification';                  
              case 5
                  ptv_str = 'Filtration';
              case 6
                  ptv_str = 'Control Performance';
              case 7
                  ptv_str = 'Shut Down';
              case 8
                  ptv_str = 'Reset';
              case 9
                  ptv_str = 'Close Graphs';
              case 10
                  ptv_str = 'Help';
              case 11
                  ptv_str = 'Setup';
              case 12
                  ptv_str = 'Effects On';
              case 13
                  ptv_str = 'Effects Off';
              case 14
                  ptv_str = 'Show results';
              case 15
                  ptv_str = 'Date';
              case 16
                  ptv_str = 'Time';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI INPUT STRING
    %
    case 8
        
          switch ptv_str_num
              case 1
                  ptv_str = 'n =';
              case 2
                  ptv_str = 'K =';
              case 3
                  ptv_str = 'T =';
              case 4
                  ptv_str = 'D =';
              case 5
                  ptv_str = 'Tu =';
              case 6
                  ptv_str = 'Tn =';
              case 7
                  ptv_str = 'T_pe =';
              case 8
                  ptv_str = 'ksi_pe =';
              case 9
                  ptv_str = 'D_pe =';
              case 10
                  ptv_str = 'Z_R =';
              case 11
                  ptv_str = 'T_I =';
              case 12
                  ptv_str = 'T_D =';
              case 13
                  ptv_str = 'T_R =';
              case 14
                  ptv_str = 'NUM =';
              case 15
                  ptv_str = 'DEN =';
              case 16
                  ptv_str = 'W_Initial =';
              case 17
                  ptv_str = 'W_Final =';
              case 18
                  ptv_str = 'W_Step_Time =';
              case 19
                  ptv_str = 'R_Initial =';
              case 20
                  ptv_str = 'R_Final =';
              case 21
                  ptv_str = 'R_Step_Time =';
              case 22
                  ptv_str = 'Control_Precision =';
              case 23
                  ptv_str = 'Sim_Time =';
              case 24
                  ptv_str = 'U_Min_Boundary =';
              case 25
                  ptv_str = 'U_Max_Boundary =';
              case 26
                  ptv_str = 'Q_u for ISE_u =';
              case 27
                  ptv_str = 'Q_du for ISE_du =';
              case 28
                  ptv_str = 'Q_de for ISE_de =';
              case 29
                  ptv_str = 'u_0 =';
              case 30
                  ptv_str = 'u_Inf =';
              case 31
                  ptv_str = 'y_0 =';
              case 32
                  ptv_str = 'y_Max =';
              case 33
                  ptv_str = 'y_Min =';
              case 34
                  ptv_str = 'y_Inf =';
              case 35
                  ptv_str = 't_0 =';
              case 36
                  ptv_str = 't_1 =';
              case 37
                  ptv_str = 't_2 =';
              case 38
                  ptv_str = 't_D =';
              case 39
                  ptv_str = 't_Max =';
              case 40
                  ptv_str = 't_Min =';
              case 41
                  ptv_str = 'IAE =';
              case 42
                  ptv_str = 'ISE =';
              case 43
                  ptv_str = 'ITSE =';
              case 44
                  ptv_str = 'ISE_u =';
              case 45
                  ptv_str = 'ISE_du =';
              case 46
                  ptv_str = 'ISE_de =';
              case 47
                  ptv_str = 'delta_u =';
              case 48
                  ptv_str = 'order =';
              case 49
                  ptv_str = 'omega =';
              case 50
                  ptv_str = 'ripple r =';
              case 51
                  ptv_str = 'Filtration error =';
              case 52
                  ptv_str = 'n_Max =';
              case 53
                  ptv_str = 'Settling_Time';
              case 54
                  ptv_str = 'Max_Overshoot';
              case 55
                  ptv_str = 'ITAE =';
              case 56
                  ptv_str = 'ISTAE =';
              case 57
                  ptv_str = 'ISTSE =';
              case 58
                  ptv_str = 'b_W =';
              case 59
                  ptv_str = 'T_F =';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end
 
    % GUI ERROR STRING
    %
    case 9
        
          switch ptv_str_num
              case 1
                  ptv_str = ' Incorrect input! Just the real number is required!';
              case 2
                  ptv_str = ' Order n have to be a positive integer!';
              case 3
                  ptv_str = ' The time delay D have to be a non negative real number!';
              case 4
                  ptv_str = ' Damping coeficient ksi_pe have to be a real positve number lower or equal 1!';
              case 5
                  ptv_str = ' File HELP.HTML not found!';
              case 6
                  ptv_str = ' The controller parameters has to be real numbers!';
              case 7
                  ptv_str = ' The simulation Sim_Time has to be a non-negative number!';
              case 8
                  ptv_str = ' W_Step_Time has to be a positive number!';
              case 9
                  ptv_str = ' R_Step_Time has to be a positive number!';
              case 10
                  ptv_str = ' Integral Criteria Parameters have to be positive numbers!';
              case 11
                  ptv_str = ' U_Min_Boundary has to be lower than U_Max_Boundary';
              case 12
                  ptv_str = ' Control_Precision has to be upper than 0 and lower than 1!';
              case 13
                  ptv_str = ' Incorrect input! Just the vector of real numbers is required!';
              case 14
                  ptv_str = ' Time: t_0 < t_D < t_1 < t_2 < Sim_Time! Or time: t_0 < t_D <  t_Max < t_Min < Sim_Time!';
              case 15
                  ptv_str = ' If y_Inf is positive y_Min and y_0 have to be lower than y_Max and oposite for negative y_Inf!';  
              case 16
                  ptv_str = ' Process model is';
              case 17
                  ptv_str = ' unproper,';
              case 18
                  ptv_str = ' unstable,';
              case 19
                  ptv_str = ' on the boundary of stability,';
              case 20
                  ptv_str = ' not controllable,';
              case 21
                  ptv_str = ' not observable,';
              case 22
                  ptv_str = ' Sign of the controller gain Z_R is different to the plant model gain K!';
              case 23
                  ptv_str = ' Experimental methods require aperiodic process model!';
              case 24
                  ptv_str = ' It is not possible to use identification of dumped periodic process! Try identification by Strejc!';
              case 25
                  ptv_str = ' Chosen data file has to have suffix *.txt or *.dat!';
              case 26
                  ptv_str = ' Chosen data file includes incorrect data!';
              case 27
                  ptv_str = ' Set time t_0 is not included in data file!';
              case 28
                  ptv_str = ' Omega has to be the vector with one or two elements of positive value lower than 1!';
              case 29
                  ptv_str = ' Filtration order has to be a positive integer!';
              case 30
                  ptv_str = ' In the case "highpass" filter, omega has to be a real number!';
              case 31
                  ptv_str = ' In the case "bandstop" filter, omega has to be two-element vector!';
              case 32
                  ptv_str = ' Elements of vector omega cannot be the same!';
              case 33
                  ptv_str = ' Chebyshev filter requires one element vector ripple r!';
              case 34
                  ptv_str = ' Improved filtration requires 3-times longer datafile than filter order!';
              case 35
                  ptv_str = ' Data file has not been saved!';
              case 36
                  ptv_str = ' Vector DEN has to have more than one element!';
              case 37
                  ptv_str = ' Impossible to get lower order model than 1st order model!';
              case 38
                  ptv_str = ' Order n_lower has to be lower than n_Max!';
              case 39
                  ptv_str = ' Parameter T_I has to be a positive real number!';
              case 40
                  ptv_str = ' Parameter T_D has to be a positive real number!';
              case 41
                  ptv_str = ' Parameter T has to be a positive real number!';
              case 42
                  ptv_str = ' Parameter T_pe has to be a positive real number!';
              case 43
                  ptv_str = ' Closed-loop system is unstable!';
              case 44
                  ptv_str = ' Closed-loop system is on the boundary of stability!';
              case 45
                  ptv_str = ' Parameter b_W has to be greater than 0!';
              case 46
                  ptv_str = ' Impossible to tune the controller for this process model parameters by this method!';
              case 47
                  ptv_str = ' Parameter T_F has to be a non negative real number!';
              case 48
                  ptv_str = ' Order n has to be lower than 9!';
              case 49
                  ptv_str = ' Function EXPORTFIG not found!';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % GUI PLOT STRING
    %
    case 10
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Closed-loop step response';
              case 2
                  ptv_str = 'Control input';
              case 3
                  ptv_str = 'Time t';
              case 4
                  ptv_str = 'Output variable y(t)';
              case 5
                  ptv_str = 'Manipulated variable u(t)';
              case 6
                  ptv_str = 'OV y(t) without constraint on MV u(t)';
              case 7
                  ptv_str = 'OV y(t) after constraint on MV u(t)';
              case 8
                  ptv_str = 'Upper boundary of OV y(t)';
              case 9
                  ptv_str = 'Lower boundary of OV y(t)';
              case 10
                  ptv_str = 'SP w(t)';
              case 11
                  ptv_str = 'MV u(t) without constraint';
              case 12
                  ptv_str = 'MV u(t) before constraint';
              case 13
                  ptv_str = 'MV u(t) after constraint';
              case 14
                  ptv_str = 'Identification output';
              case 15
                  ptv_str = 'Data loaded from data file';
              case 16
                  ptv_str = 'Step response';
              case 17
                  ptv_str = 'Original output';
              case 18
                  ptv_str = 'Filtration output';
              case 19
                  ptv_str = 'Comparison of step responses';
              case 20
                  ptv_str = 'Compared output';
              case 21
                  ptv_str = 'Lower order model output';
              case 22
                  ptv_str = 'Normalised output';
              case 23
                  ptv_str = 'Nominal output';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

    % PTC - CONTROLER TUNING TEXT
    %
    case 11
        
          switch ptv_str_num
              case 1
                  ptv_str = 'Ziegler - Nichols method|Strejc method|Cohen - Coon method|Chien - Hrones - Reswick method (0% overshoot)|Chien - Hrones - Reswick method (20% overshoot)|Minimum ITAE method (Disturbance rejection)|Lopez IAE-ISE method';
              case 2
                  ptv_str = 'Ziegler - Nichols method|Strejc method|Cohen - Coon method|Direct synthesis method using approximeted closed-loop model|Haalman method|Chien - Hrones - Reswick method (0% overshoot)|Chien - Hrones - Reswick method (20% overshoot)|Half dampping method|Rivera - Morari method|Rivera - Morari method (improved)|Astrom - Hagglund method (Ms = 1.4)|Astrom - Hagglund method (Ms = 2.0)|Minimum ISE method|Minimum ITSE method|Minimum ISTSE method|Minimum IAE method|Minimum ITAE method|Lopez IAE-ISE method|Liptak method|St. Clair method|Shinkey method|McMillan method|Hazebroek and Van der Waerden method|Fertik and Sharpe method|Parr method|Klein et al. method|Borresen and Grindal method|Ziegler-Nichols method (improved)|Ziegler-Nichols ultimate cycle method|Suyama method|Kuhn T-sum method';
              case 3
                  ptv_str = 'Ziegler - Nichols method|Strejc method |Cohen - Coon method|Direct synthesis method using approximeted closed-loop model|Chien - Hrones - Reswick method (0% overshoot)|Chien - Hrones - Reswick method (20% overshoot)|Half dampping method|Rivera - Morari method|Astrom - Hagglund method (Ms = 1.4)|Astrom - Hagglund method (Ms = 2.0)|Wang - Juang - Chang method|Minimum ISE method|Minimum ITSE method|Minimum ISTSE method|Minimum IAE method|Minimum ITAE method|Lopez IAE-ISE method|Kuhn T-sum method';
              case 4
                  ptv_str = 'Cohen - Coon method';
              case 5
                  ptv_str = 'Pole placement method|Naslin method|Multiple dominant pole method (for astatic model)';
              case 6
                  ptv_str = 'Pole placement method|Naslin method|Method based on gain and phase margin|Required model method|Multiple dominant pole method|Optimal module method';
              case 7
                  ptv_str = 'Pole placement method|Naslin method|Method based on gain and phase margin|Required model method|Multiple dominant pole method|Optimal module method';
              case 8
                  ptv_str = 'Pole placement method|Naslin method|Multiple dominant pole method (for astatic model)';
              case 9
                  ptv_str = ' Order n has to be higher than 1!';
              case 10
                  ptv_str = ' Order n has to be higher than 2!';
              case 11
                  ptv_str = ' Time constant of closed-loop model, T_CL < Tn';
              case 12
                  ptv_str = 'T_CL = ';
              case 13
                  ptv_str = ' Setpoint tracking';
              case 14
                  ptv_str = ' Disturbance rejection';
              case 15
                  ptv_str = ' Time constant of closed-loop model, T_CL>0.2*Tn and T_CL>1.7*Tu';
              case 16
                  ptv_str = ' Maximal overshoot:';
              case 17
                  ptv_str = ' 0%| 5%| 10%| 15%| 20%| 25%| 30%| 35%| 40%| 45%| 50%';
              case 18
                  ptv_str = ' Time constant of closed-loop model, T_CL>0.2Tn and (T_CL/Tu)>0.25';
              case 19
                  ptv_str = ' 1 %| 3 %| 5 %| 8 %| 12 %| 16 %| 20 %';
              case 20
                  ptv_str = ' Process model parameters:';
              case 21
                  ptv_str = ' Reference polynom:';
              case 22
                  ptv_str = ' Other| Binomic| Butterworth| Minimum t(5%)| Minimum ITAE criterium';
              case 23
                  ptv_str = 'ksi_0 =';
              case 24
                  ptv_str = 'w_0 =';
              case 25
                  ptv_str = ' Set pole w_0 is unstable!';
              case 26
                  ptv_str = 'S_0 = ';
              case 27
                  ptv_str = 'Unstable pole found!';
              case 28
                  ptv_str = 'Stable pole found!';
              case 29
                  ptv_str = 'Order n has to be 2 or 3!';
              case 30
                  ptv_str = ' 2nd order aperiodic process model required!';
              case 31
                  ptv_str = ' Method requires transport delay D as a positive number!';
              case 32
                  ptv_str = 'Order n has to be 1!';
              case 33
                  ptv_str = 'Set gain margin Gm and phase margin Pm:';
              case 34
                  ptv_str = 'Gm [dB]';
              case 35
                  ptv_str = 'Pm [deg]';
              case 36
                  ptv_str = ' Gain margin Gm has to be larger than 1!';
              case 37
                  ptv_str = ' Impossible to tune the controller for this process model by this method!';
              case 38
                  ptv_str = ' Order n has to be 3!';
              case 39
                  ptv_str = ' Aperiodic process model required!';
              case 40
                  ptv_str = ' For PID Controller tuning order n has to be 2!';
              case 41
                  ptv_str = ' Damping coeficient has to be higher than 0.71!';
              case 42
                  ptv_str = ' Damping coeficient has to be higher than 0.5!';
              case 43
                  ptv_str = ' Order n has to be lower than 3!';
              case 44
                  ptv_str = ' This method requires Tu > 0!';
              otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_NUM';
           end

% ------------------- %

    otherwise
                  ptv_str = 'ERROR:PTG_STRING_0:STR_CAT';
  end