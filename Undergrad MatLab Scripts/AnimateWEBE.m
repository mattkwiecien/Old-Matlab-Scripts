function AnimateWEBE(x,u0,v0,c,T,num,bc)

f = figure;                         % Create the figure for the animation
hold on                             % Reuse the same figure for multiple graphs
box on                              % Draw a box around the graph
grid on                             % Turn the grid on
set(gca, 'FontSize', 18)            % Increase the font size
L = x(end);                         % Define the x vector to run from 0 to L
u=u0;                               % The initial value of u(x,t) at t = 0 

axis([ 0 L -max(u0) max(u0) ])      % Set the bounds of the x and y axes

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
           
            u = u + (An(n)*cos((n*pi*c*t)./L) + Bn(n)*sin((n*pi*c*t)./L))*sin((n*pi*x)/L);
           
        end                     
                            
    
    set(ps, 'YData', u);                
    
    pause(0.001);                       
    
    end
    
elseif x(1) == 0 && x(end)>0;

    for t = 0.05 : 0.05 : T            
        if bc==1;
               
           [~,~,An]=fcoeff(x,u0,num,bc);       
           [~,~,Bnf]=fcoeff(x,v0,num,bc);
           A0=0;     
           u=A0;
           
           for n=1:1:num
                
           Bn=Bnf*(2/(n*pi*c));    
            
                u = u + (An(n)*cos((n*pi*c*t)./L) + Bn(n)*sin((n*pi*c*t)./L))*sin((n*pi*x)/L);
                
            end
           
        elseif bc==2;
               
           [A0,An,~]=fcoeff(x,u0,num,bc);          
           [~,~,~]=fcoeff(x,u0,num,bc); 
           u=A0;
          Bn=A0+An;
           
           for n=1:1:num
                
           
            
                u = u + (An(n)*cos((n*pi*c*t)./L) + Bn(n)*sin((n*pi*c*t)./L))*cos((n*pi*x)/L);
                
            end
        end
        
           
           
                          
                            
    
        set(ps, 'YData', u);                
    
        pause(0.001);  
    end
end

%*************************************************************************

whos                                 

close(f);                            
