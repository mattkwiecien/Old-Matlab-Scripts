function ode45_rlc

xinit = [1;1];

R = .5;
C = 2;
L = 2;

[T,X] = ode45(@ddt,[0 60], xinit);

plot(T,X(:,1),'r');
hold on
plot(T,X(:,2),'b');

function dt = ddt(t,x)
    dt(1) = x(2);
    dt(2) = -R/L*x(2) - (1/(L*C))*x(1) + sin(1.5*t)/L;
    dt=dt';
end

end
