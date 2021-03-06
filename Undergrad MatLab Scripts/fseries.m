function [ s ] = fseries(x,f,num,bc)
%The function fseries calculates the fourier series for a given function 
%'f', and a given interval 'x'.  The function requires input of 'f', 'x', and 
%'num' for the number of terms, and 'bc' for the boundary conditions
%The values for the boundary conditions are 1 for free and 2 for fixed.

L=x(end);


%The fourier coefficients are calculated and called from the fcoeff
%function
if bc==1;
    
    s=0;
    
    [~,~,bn]=fcoeff(x,f,num,bc);
    
    for index = 1:1:num
        
        s = s + bn(index)*sin((index*pi*x)/L);
    
    end
    
elseif bc==2;
    
    [a0,an,~]=fcoeff(x,f,num,bc);
    
    s=a0;

    for index = 1:1:num
        
        s = s + an(index)*cos((index*pi*x)/L);
    
    end
    
end

%The fourier series is calculated by looping 'num' times to calculate 'num' 
%terms.


end


    
