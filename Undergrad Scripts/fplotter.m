function fplotter(x,f,num,bc)
%The function fplotter calculates the fourier series of a given function
%'f' and a given interval 'x' with the number of terms 'num' and a boundary
%condition 'bc'.  The function then graphs the input function 'f' and the
%fourier series 's' to compare the two.  

%The fourier series is calculated and called from the fseries function
s=fseries(x,f,num,bc);

%The two functions are plotted
plot(x,f,'-*',x,s,'-x');
xlabel('x');
ylabel('f(x)');
legend('Original Function','Fourier Series');
grid on
title('Comparison of Fourier Series and a Function f(x)')

end
