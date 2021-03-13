function [m,xn] = derive(x,f)

n=length(x);
xn=zeros(1,n-1);
m=zeros(1,n-1);

for i=1:n-1;
    m(i)=(f(i+1)-f(i))/(x(i+1)-x(i));
    xn(i)=(x(i+1)+(x(i)))/2;
    
end
plot (xn,m,x,f)
