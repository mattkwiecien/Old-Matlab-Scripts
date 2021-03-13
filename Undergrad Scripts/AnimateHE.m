function AnimateHE(x,u0,a,T,num,bc)

f = figure;                         % Create the figure for the animation
hold on                             % Reuse the same figure for multiple graphs
box on                              % Draw a box around the graph
grid on                             % Turn the grid on
set(gca, 'FontSize', 18)            % Increase the font size
L = x(end);                         % Define the x vector to run from 0 to L

u=u0;                               % The initial value of u(x,t) at t = 0 
g=((a^2*num^2*pi^2)/L^2);


axis([ 0 L -max(u0) max(u0) ])    
xlabel('x')
ylabel('f(x)')

ps = plot(x, u, 'linewidth', 2);    

pause
%*************************************************************************
if (-1*x(1)) == (x(end));
    
    [A0,An,Bn] = fcoeff(x,u0,num,bc);
    
    for t = 0.05 : 0.05 : T           
    
        u=A0;                           
        
        for n=1:1:num    
           
            u = u + (An(n)*cos((n*pi*x)./L) + Bn(n)*sin((n*pi*x)./L))*exp(-g*t);
           
        end                     
                            
    
    set(ps, 'YData', u);                
    
    pause(0.001);
    
    end
    
    
    
elseif x(1) == 0 && x(end)>0;
    
    for t = 0.05 : 0.05 : T             
        if bc==1 
            [~,~,Bn]=fcoeff(x,u0,num,bc); 
            An=zeros(1,num);
            A0=0;
                
        elseif bc==2
            
            [A0,An,~]=fcoeff(x,u0,num,bc);
            Bn=zeros(1,num);
            
        end
        
        u=A0;
        
            for n=1:1:num   
                
                u = u + (An(n)*cos((n*pi*x)./L) + Bn(n)*sin((n*pi*x)./L))*exp(-g*t);
                
            end
                                     
    
        set(ps, 'YData', u);                
    
        pause(0.001); 
    end
    
end



%*************************************************************************



close(f);
end

