function [ sum ] = IntegralCalculator(x,f)
%The function calculates the integral of a given function 'f' over the 
%interval 'x'.

sum = 0;

%The function loops for the length of the domain, calculating the area of
%each length beneath the curve.  
for index = 1:1:(length(x)-1)
    
    sum = sum + (((f(index+1)+f(index))/2)*(x(index+1)-x(index)));
    
end
     
end
