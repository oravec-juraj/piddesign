

function plt(matrix)

for n = 2 : size(matrix,2)
    
    plot(matrix(:,1),matrix(:,n))
    hold on
    
end

hold off