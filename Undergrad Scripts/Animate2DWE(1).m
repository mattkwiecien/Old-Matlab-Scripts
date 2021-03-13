function Animate2DWE(xg,yg,u0,v0,c,T,num)

f = figure;  
hold on                                     
box on                                      
%grid off           
%set(gca, 'FontSize', 18)  
xlabel('x')
ylabel('y')
zlabel('z')

[Lx]=max(xg(:));
[Ly]=max(yg(:));
[maxval] = max(u0(:));

u = u0;
Amn = zeros(num,num);
Bmn = zeros(num,num);
Bmn1 = zeros(num,num);
axis([0 Lx 0 Ly -.5*maxval .5*maxval])
ps = surf(xg, yg, u);

pause

for t = .05 : .05 : T
    
  
    u = 0;
    
    
    for n = 1:1:num
        for m = 1:1:num
            
            j = (m*pi)/Lx;
            i = (n*pi)/Ly;
            
            wmn = sqrt((j^2*c^2)+(i^2*c^2));
            
            g = sin(i*xg).*sin(j*yg);
            
            Amn(m,n) = (4/(Lx*Ly))*DInt(xg,yg,(u0.*g));
            Bmn1(m,n) = (4/(Lx*Ly))*DInt(xg,yg,(v0.*g));
            Bmn(m,n) = Bmn1(m,n) ./ wmn;

            
            u = u + (Amn(m,n)*cos(wmn*t)+Bmn(m,n)*sin(wmn*t))*g;
            
        end
    end
    
    set(ps, 'Zdata', u);                
    pause(0.025); 
    
end

close(f);

pause