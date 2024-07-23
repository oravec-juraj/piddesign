

function type = ptf_get_modelparam(input1,input2)

% Chk input
%
if (nargin == 1)
    type_input = class(input1);
    if(type_input(1)~='t')
        
        error('PTF_GET_MODELPARAM:1: Incorrect input')
    
    else
        
        [num,den] = tfdata(input1,'v');

    end
    
else
    
    num = input1;
    den = input2;
    
end

% Chk gain
%
for n = 2 : size(num(2)-1)
    
    if(num(n) ~= 0)
        error('PTF_GET_MODELPARAM:2: Incorrect input')
    end

end

% Model clasification
%

% 1 - First order model
%
if(size(den,2) == 2)
   
    type = 1;

% 2 - Strejc model
%
elseif(size(den,2) >= 3) & (imag(roots(den)) == 0) & (sum( find(den==0) ) == 0)
    
    type = 2;

% 3 - Damped periodic model
%
elseif(size(den,2) == 3) & (imag(roots(den)) ~= 0)
    
    type = 3;
    
% 4 - Astatic model + strejc model
%
elseif(size(den,2) >= 3) & (imag(roots(den)) == 0) & (sum( find(den==0) ) ~= 0)
    
    type = 4;

else
    
    type = -Inf;
    
end


num
den

% Strejc model
%
T = nthroot(den(1),size(den,2)-1);

    

    
