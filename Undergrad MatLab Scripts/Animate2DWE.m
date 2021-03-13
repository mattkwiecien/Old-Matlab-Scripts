function Animate2DWE(xg,yg,u0,v0,c,T,num)

%sets the graph/plot properties for the animation
f = figure;  
hold on                                     
box on 
view(3);
grid on           
set(gca, 'FontSize', 18)  
xlabel('x')
ylabel('y')
zlabel('z')

%Calculates the length of Lx and Ly and the maximum value of the input
%vector
[Lx]=max(xg(:));
[Ly]=max(yg(:));
[maxval] = max(u0(:));
%caxis([-maxval maxval])

%preallocates the arrays
wmn = zeros(num,num);
Amn = zeros(num,num);
Bmn = zeros(num,num);
u=u0;

axis([0 Lx 0 Ly -maxval maxval])
ps = surf(xg, yg, u, 'EdgeColor', 'flat');
camlight headlight; lighting phong
pause

%The coefficient matrices are calculated for the sum
for m = 1:1:num
    for n = 1:1:num
        wmn(m,n) = sqrt( ((m^2*pi^2*c^2)/Lx^2) + ((n^2*pi^2*c^2)/Ly^2) );
        g = sin(xg*m*pi/Lx).*sin(yg*n*pi/Ly);
        Amn(m,n) = (4/(Lx*Ly))*DInt(xg,yg,(u0.*g));
        Bmn(m,n) = ((4/(Lx*Ly))*DInt(xg,yg,(v0.*g)))/wmn(m,n); 
    end
end

%the sum is calculated and plotted at intervals of .05 seconds 
for t = .05 : .05 : T
    u = 0;
    for m = 1:1:num
        for n = 1:1:num
            
            g = sin(xg*m*pi/Lx).*sin(yg*n*pi/Ly);
            u = u + (Amn(m,n)*cos(wmn(m,n)*t) + Bmn(m,n)*sin(wmn(m,n)*t))*g;
            
        end
    end

    set(ps, 'Zdata', u);                
    pause(0.05); 
    
    
end

close(f);
