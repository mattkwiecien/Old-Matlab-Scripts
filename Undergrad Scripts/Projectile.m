function[]=Projectile(vi,theta,xi,yi)
g=9.8;
%The function calculates the 'x' and 'y' components of the velocity for the
%user input of intial velocity 'vi', and the angle of projection
%'theta'
vxi=(vi*cosd(theta));
vyi=(vi*sind(theta));
%Th function calculates the time intervals from 1 to the final number in
%increments of .1 and runs the array functions, 'x(t)' and 'y(t)' 1 to
%1000000
ti=0;
for t = 1:1:10000000
    x(t)=xi+(vxi*ti);
    y(t)=yi+(vyi*ti)-(((1/2)*g)*ti^2);
    ti=ti+.001;
    %the function will break if a negative value for y(t) is calculated
if y(t)<0
    break
end
%The function then plots x(t) vs y(t)
plot (x,y)
xlabel('x(t)')
ylabel('y(t)')
title('Projectile Motion')
end
