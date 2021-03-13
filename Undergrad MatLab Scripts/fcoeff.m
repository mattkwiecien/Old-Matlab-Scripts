function [a0, an, bn] = fcoeff(x,f,num)
%The function fcoeff calculates the fourier coefficients for a given
%function 'f' over the given interval 'x'.  The function calculates 'num'
%amount of terms, and has input of 'bc' for boundary conditions, where 1
%corresponds to a free wave, and 2 to a fixed wave.  

L=x(end);

a0=InnerProduct(x,f,1)/(2*L);

an=0:0:0;

bn=0:0:0;

%If the interval is in the form of -L to L, the function calculates the
%fourier coefficients in the following loop.  

if (-1*x(1)) == (x(end));
    
    a0=InnerProduct(x,1,f)/(2*L);

    
    for n = 1:1:num
       
        k=(n*pi/L);
        
        an(n)=InnerProduct(x,exp(-1i*k*x),f)/(2*L);
    
    end

    
    for n = 1:1:num
        
        k=(n*pi/L);
        
        bn(n)=InnerProduct(x,exp(1i*k*x),f)/(2*L);
    
    end


%If the interval is in the form of 0 to L, the function instead calculates
%the fourier coefficients in the following loop.  

elseif x(1) == 0 && x(end)>0;
    
    
    %Given the free boundary condition, the function then calculates the
    %coefficients for the free/even scenarios
        
%     for index = 1:1:num
%         
%     a0=2*InnerProduct(x,f,1)/(2*L); 
%     
%     an(index)=2*InnerProduct(x,f,cos((index*pi*x)/L))/L;
%     
%     bn(index)=2*InnerProduct(x,f,sin((index*pi*x)/L))/L;
%     
%     end 
    
    
    %Given the fixed boundary condition, the function then instead
    %calculates the coefficients for the fixed/odd scenario.
      
    for n = 1:1:num
        
    a0=2*InnerProduct(x,f,1)./(2*L); 
    
    q=(n*pi*x)./L;
    
    an(n)=(2/L)*InnerProduct(x,f,cos(q));
    
    bn(n)=(2/L)*InnerProduct(x,f,sin(q));
    
    
    end
    
end
    
end

