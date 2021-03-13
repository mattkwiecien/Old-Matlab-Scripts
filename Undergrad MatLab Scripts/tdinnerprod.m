function [ tdinnerprod ] = tdinnerprod( x, y, f, g )
%The function calculates the inner product on Vpws for given functions 'x',
%'f', and over a interval 'x'.  

q = f.*g;

%The integral is then calculated and called on by the IntergralCalculator
%function.  
tdinnerprod = DInt(x,y,q);

end