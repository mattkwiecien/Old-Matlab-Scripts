function myodesolverho(ti,tf,yi,vi,dt,m,k,b)
%The myodesolverho function will use Euler's method to solve the first 
%order system of differential equations for a harmonic oscillator.  The 
%user input ofinitial time 'ti', final time 'tf', initial position 'yi', initial
%velocity 'vi', step size 'dt', mass 'm', spring constant 'k', and damping
%constant 'b', are all needed in order to perform the Euler approximation.
Y(1)= yi;
V(1)= vi;
T(1)= ti;
 
Vn = V(1);
Yn = Y(1);
Tn = T(1);
 
n=1;
%The function will perform a loop repeating loop for the given 'dt' amount
%of times between the user input of 'ti' and 'tf'.
for t=ti:dt:tf;
    %The eulerfuny and eulerfunv are called and stored in arrays.
    Y(n+1)=eulerfuny(Yn,Vn,dt);
    V(n+1)=eulerfunv(Yn,Vn,dt,m,k,b);
    T(n+1)=t+dt;  
    %A new value of Vn and Yn are stored to repeat the loop.
    Vn=V(n+1);
    Yn=Y(n+1);
    
    n=n+1;
end
%The arrays for T, Y, and V are plotted.
plot(T(),Y(),'-b',T(),V(),'-r');
axis([ti tf -1.5 1.5]),title('Euler Approximate for an Undamped Harmonic Oscillator')
xlabel('t'),ylabel('y(t),v(t)');
legend(' = Displacement, x(t)',' = Velocity, v(t)');
end
