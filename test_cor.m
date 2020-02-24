
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

function cor = test_cor(varargin)

% TEST_COR
%
% Funkcia na testovanie korektnosti vstupov
% Zistuje, ci vstup je realne cislo rozne od +/- Inf
% Vystupy funkcie:
% 1 => je
% 0 => nie je
c = nargin;
cor = 1;
for i=1:c
    if(sum(size(varargin{i}))~=2||isreal(varargin{i})~=1||varargin{i}==Inf||varargin{i}==-Inf)
        cor = 0;
    end
end
