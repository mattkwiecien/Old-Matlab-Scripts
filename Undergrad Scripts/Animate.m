function Animate(x,u0,v0,c,T,num,bc)

f = figure;                         % Create the figure for the animation
hold on                             % Reuse the same figure for multiple graphs
box on                              % Draw a box around the graph
grid on                             % Turn the grid on
set(gca, 'FontSize', 18)            % Increase the font size
L = x(end);                         % Define the x vector to run from 0 to L
u=u0;                               % The initial value of u(x,t) at t = 0 

axis([ 0 L -max(u0) max(u0) ])      % Set the bounds of the x and y axes

[~,~,An]=fcoeff(x,u0,num,bc);       % Call the value for the odd values of the fourier series with u0   
[~,~,Bnf]=fcoeff(x,v0,num,bc);      % Call the value for the odd values of the fourier series with v0

xlabel('x')
ylabel('f(x)')

ps = plot(x, u, 'linewidth', 2);    % Plot u(x,t) at t=0

%*************************************************************************

for t = 0.05 : 0.05 : T             % Loop from t = 0 to t = T
    
    u=0;                            % Reassign the value of u for the looping sum
   
        for n=1:1:num               % Loop for the given number of fourier coefficients
           
           Bn=Bnf*(2/(n*pi*c));     % Multiplication by the constant with the Bn term
            
           u = u + (An(n)*cos((n*pi*c*t)./L) + Bn(n)*sin((n*pi*c*t)./L))*sin((n*pi*x)/L);
           
        end                     
                            
    
    set(ps, 'YData', u);                
    
    pause(0.1);                       % pause for 0.1 seconds
    
end

%*************************************************************************

whos                                  % Display the values of the vectors generated

close(f);                             % Close the figure window
