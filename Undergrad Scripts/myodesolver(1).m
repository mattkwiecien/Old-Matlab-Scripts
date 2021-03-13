function myodesolver(ti,tf,Pi,dt)
P(1)=Pi;
Pnew=Pi;
index=1;
%t goes from the input value of ti to tf in increments of dt input by the
%user

for t=ti:dt:tf;

    index=index+1;
    %Eulerfun is called with the inputs of pnew, t and dt
    M=eulerfun(t,Pnew,dt);
    
    %Eulerfun is stored in an array
    P(index)=M;
    
    %Each value of t is stored in a second array
    T(index)=t+dt;
    
    %A new  value of pnew is stored
    Pnew=M;


end

%The arrays T, P are plotted
plot(T,P),xlabel('t'),ylabel('P'),title('P vs T');

%The values of , Pt, T, and P are displayed
T
P
%The slpfield function is called, with inputs on boundaries of ti, tf, Pi,
%and M, where M is the Euler function.  
slpfield(ti,tf,Pi,M);
end