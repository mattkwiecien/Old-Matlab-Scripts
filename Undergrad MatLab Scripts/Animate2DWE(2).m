function Animate2DWE(xg,yg,u0,v0,c,T,num)
%xg yg]=meshgrid(x,y);

f = figure;  

hold on                                     
box on                                      
grid on           
set(gca, 'FontSize', 18)  

xlabel('x')
ylabel('f(x)')

[Lx]=max(xg(:));
[Ly]=max(yg(:));

[maxval] = max(u0(:));

u=u0;

axis([0 Lx 0 Ly -1.5*maxval 1.5*maxval])

ps = surf(xg, yg,  u, 'linewidth', 2);    


for t = .05 : .05 : T
    
    [Amn,  ~ ] = tdfcoeff(xg,yg,u0,v0,num);   
    [ ~ , Bmn1] = tdfcoeff(xg,yg,u0,v0,num);    
    u = 0;
    
    
    for n = 1:1:num
        for m = 1:1:num
            
            ct = (sin((m*pi*xg)/Lx)*sin((n*pi*yg)/Ly));
            
            wmn = (((m^2 * pi^2 * c^2) / Lx^2) + ((n^2 * pi^2 * c^2) / Ly^2))^(1/2);
           
            Bmn = Bmn1 ./ wmn;
                         
            u = u + (Amn(n,m)*cos(wmn*t) + Bmn(n,m)*sin(wmn*t))*ct;
        end
    end
    
    set(ps, 'Ydata', u);                
    pause(0.1); 
    
end

close(f);

pause