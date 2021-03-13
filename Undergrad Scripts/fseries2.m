function [ s ] = fseries2(x,f,num)
%The function fseries calculates the fourier series for a given function 
%'f', and a given interval 'x'.  The function requires input of 'f', 'x', and 
%'num' for the number of terms, and 'bc' for the boundary conditions
%The values for the boundary conditions are 1 for free and 2 for fixed.

L=x(end);
    
[a0,an,bn]=fcoeff(x,f,num,bc);
    
s=a0;
%The fourier coefficients are calculated and called from the fcoeff
%function
symmetry = input('Even or Odd Extension?','s');

if strcmp(symmetry,'Even','even') == true
    
    [a0,an,~]=fcoeff2(x,f,num);
    
elseif strcmp(symmetry, 'Odd','odd') == true
    
    [~,~,bn]=fcoeff2(x,f,num);
    

%The fourier series is calculated by looping 'num' times to calculate 'num' 
%terms.
for index = 1:1:num
        
    s = s + an(index)*cos((index*pi*x)/L) + bn(index)*sin((index*pi*x)/L);
    
end

end


    
