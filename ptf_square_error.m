% PTF_SQUARE_ERROR
%
%   Funton PTF_SQUARE_ERROR returns square error of vectors
%
%   [square_error] = ptf_square_error(y1,y2)
%
%   square_error = ( sum( y1 - y2 )^2 )/( y1^2 )



function [square_error] = ptf_square_error(y1,y2)

% Check column vector format of y1
%
if(size(y1,2)~=1)
    y1 = y1';
end

% Check column vector format of y2
%
if(size(y2,2)~=1)
    y2 = y2';
end

if(length(y1) == length(y2))

    % square_error counting
    %
    square_error = (y1-y2)'*(y1-y2)/sum(y1.*y1);

else

    square_error = -Inf;

end