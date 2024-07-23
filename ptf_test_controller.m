% PTF_TEST_CONTROLLER
%
%   Function PTF_TEST_CONTROLLER test  parameters of the tuned controller 
%   Function returns 1, if tuned parameters are correct or function returns 0, if
%   tuned parameters are not correct
%
%   ptv_test = ptf_test_controller(zr,ti,td)



function ptv_test = ptf_test_controller(zr,ti,td,K)

    if(isnumeric(zr)&&isnumeric(ti)&&isnumeric(td))
        if(((zr<0 && K>0)||(zr>0 && K<0) || isreal(zr)==0 || zr==0 || zr == Inf) || (isreal(ti)==0 || ti<=0 || ti == Inf) || (isreal(td)==0 || td<0 || td == Inf))
            ptv_test = 0;
        else
            ptv_test = 1;
        end
    else
        ptv_test = 0;
    end