function [sum] =  DInt(x,y,f)

[Lx, Ly]=size(f);
sum = 0;

dx = x(1,2)-x(1,1);
dy = y(2,1)-y(1,1);

for j = 1:(Ly-1);
    for i = 1:(Lx-1);
        q1=f(i,j);
        q2=f(i,j+1);
        q3=f(i+1,j);
        q4=f(i+1,j+1);
        sum = sum + (.25*  dx*dy  *  (q1+q2+q3+q4));
        
    end 
    
    
end

        