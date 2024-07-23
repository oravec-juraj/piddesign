

function folder = home_folder(file_name)

placed = which(file_name);

% Initial values of outputs
%
folder = [];

% Temporary variables
%
k = 0;

while ( (placed(end-k) ~= '/') & (placed(end-k) ~= '\') ) & (k < length(placed))
    k = k + 1;
end
k = k + 1;

while ( (placed(end-k) ~= '/') & (placed(end-k) ~= '\') ) & (k < length(placed))
    
    folder = [placed(end-k),folder];
    k = k + 1;
    
end