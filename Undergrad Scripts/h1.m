function [] = h1(theta,vy)

g=9.81;

yf=294.2;
y=0:1:ceil(yf);
tan_term = tan(theta*((2*pi)/360));

z=zeros(1,length(y));
count=1;
length(y)

for i=0:1:length(y)-1
    
    z(count) = -((g*y(count)^2)/2) * (1/(vy^2)) + y(count)*tan_term;
    count=count+1;
    
end
plot(y,z)
xlabel('Distance (m)', 'fontSize',18)
ylabel('Height (m)', 'fontSize',18)
title('Path of our rocket to the top of Byrne Hall','fontSize',22)
xlim([0 295])
ylim([0 max(z)])
disp(z(end))
end