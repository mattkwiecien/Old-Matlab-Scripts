function [ innerProduct ] = InnerProduct( x, f, g )
%The function calculates the inner product on Vpws for given functions 'x',
%'f', and over a interval 'x'.  

y = f.*g;

%The integral is then calculated and called on by the IntergralCalculator
%function.  
innerProduct = IntegralCalculator(x,y);

end