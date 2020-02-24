% PTF_TEST_CONTROLLER
%
%   Function PTF_TEST_CONTROLLER test  parameters of the tuned controller 
%   Function returns 1, if tuned parameters are correct or function returns 0, if
%   tuned parameters are not correct
%
%   ptv_test = ptf_test_controller(zr,ti,td)

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