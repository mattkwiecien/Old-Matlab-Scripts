function DInt(x,y,f)

numY = size(y);
numX = size(x);
sum = 0;
dx = x(2)-x(1);
dy = y(2)-y(1);

for j = 1:numY-1;
    
    for i = 1:numX-1;
        
        sum = sum + (.25*dx*dy*(f(i,j)+f(i,j+1)+f(i+1,j)+f(i+1,j+1)));
        
    end
    
end

        