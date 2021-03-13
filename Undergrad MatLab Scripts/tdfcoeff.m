function [amn, bmn] = tdfcoeff(x,y,f,q,num)

[Lx]=max(x(:));
[Ly]=max(y(:));

amn=0:0:0;

bmn=0:0:0;


for n = 1:1:num
    for m = 1:1:num
    
        g = sin((m*pi*x)/Lx) * sin((n*pi*y)/Ly);

        amn(n,m) = (4/(Lx*Ly))*DInt(x,y,(f.*g));
        bmn(n,m) = (4/(Lx*Ly))*DInt(x,y,(q.*g));
        
    end
    
end



