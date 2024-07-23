

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
