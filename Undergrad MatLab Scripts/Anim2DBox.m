function Anim2DBox( xg, yg, psi0, psi0p, T, num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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
[maxval] = max(psi0(:));

%Normalization
C1 = 1 / sqrt(DInt(xg, yg, (conj(psi0).*psi0)));
C2 = 1 / sqrt(DInt(xg, yg, (conj(psi0p).*psi0p)));

psi=C1.*psi0;
psip=C2.*psi0p;

axis([0 Lx 0 Ly -maxval maxval])
ps = surf(xg, yg, psi, 'EdgeColor', 'flat');
camlight headlight; lighting phong

pause

E=zeros(num,num);
A=zeros(num,num);
B=zeros(num,num);

%coefficients
for n=1:num
    for m=1:num
        
        E(n,m) = ((n^2*pi^2)/(2*Lx)) + ((m^2*pi^2)/(2*Ly));
        eigenState=(2/(Lx*Ly)).*(sin((n*pi/Lx).*xg).*sin((m*pi/Ly).*yg));
        
        A(m,n)= DInt(xg,yg,(conj(psi).*eigenState));
        B(m,n) = 0; %DInt(xg,yg,(conj(psip).*eigenState));
        
    end
end

whos

pause

for t = .05:.05:T
    
    psi=0;
    
    for m=1:num
        for n=1:num
            
            psi = psi + (2/(Lx*Ly))*(A(m,n).*sin((n*pi/Lx).*xg) + B(m,n).*sin((m*pi/Ly).*yg)).*exp(-1i*E(m,n)*t);
            
        end
    end
    
    set(ps, 'Zdata', psi);
    pause(0.05);
end
close(f)
end

