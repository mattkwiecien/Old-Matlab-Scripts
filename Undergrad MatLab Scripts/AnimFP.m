function [  ] = AnimFP( x, psi0, num, T )
%UNTITLED2 Summary of this function goes here

f = figure;  
L=x(end);
psi=psi0;


hold on                             
box on                              
grid on
set(gca, 'FontSize', 18) 
xlabel('x')
ylabel('Probability')

axis([ -L L -max(psi0) max(psi0) ])    
probDen = psi.*conj(psi);

psReal = plot(x, real(psi), '-b', 'linewidth', 2);    
psImag = plot(x, imag(psi), '-g', 'linewidth', 2);
psDen = plot(x, probDen, '-k', 'linewidth', 3);

[A0,A,B] = fcoeff(x,psi,num);
pause

for t = .05:.04:T

    psi=A0;

    for n = 1:num
        
        
        k = n*pi/L;
        E = k^2/2;
        
        psi=psi+((A(n)*exp(-1i*k.*x) + B(n)*exp(1i*k.*x)))*exp(-1i*E*t);
        
    end
    
    probDen = psi.*conj(psi);
    
    set(psReal, 'YData', real(psi));
    set(psImag, 'YData', imag(psi));
    set(psDen, 'YData', probDen);
    
    
    pause(.001);
    
end

close(f);

end

