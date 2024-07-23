% PTF_IDENT_ERROR
%
%   Function PTF_IDENT_ERROR returns identification error
%
%   ptv_ide_err = ptf_ident_error(y_1,y_2)
%
%   y_1 = original output
%   y_2 = identification output



function ptv_ide_err = ptf_ident_error(y_1,y_2)

    ptv_ide_err = sum((y_1-y_2).^2)/sum(y_1.^2);