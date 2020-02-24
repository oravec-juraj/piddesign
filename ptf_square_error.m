% PTF_SQUARE_ERROR
%
%   Funton PTF_SQUARE_ERROR returns square error of vectors
%
%   [square_error] = ptf_square_error(y1,y2)
%
%   square_error = ( sum( y1 - y2 )^2 )/( y1^2 )

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