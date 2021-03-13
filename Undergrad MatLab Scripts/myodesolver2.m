function myodesolver2(ti,tf,Pi,dt)
P(1)=Pi;
Pt(1)=Pi;
Pnew=Pi;
index=1;
%N and k are input parameters for the ODE
N=10;
k=2;
%t goes from the input value of ti to tf in increments of dt input by the
%user

for t=ti:dt:tf;
    %Pt is the analytic solution to the ODE, calculated and graphed on the
    %same slope
    Pt(index)=(N*Pi*exp(k*t))/(N-Pi+Pi*exp(k*t));
    
    index=index+1;
    %Eulerfun is called with the inputs of pnew, t and dt
    M=eulerfun(t,Pnew,dt);
    
    %Eulerfun is stored in an array
    P(index)=M;
    
    %Each value of t is stored in a second array, where T2 = T
    T(index)=t+dt;
    T2(index)=t+dt;
    
    %A new  value of pnew is stored
    Pnew=M;
    %Pt is calculated again to account for difference in vector sizes
    Pt(index)=(N*Pi*exp(k*t))/(N-Pi+Pi*exp(k*t));

end

%The arrays T, P, T2, and P2 are plotted
plot(T,P,T2,Pt),xlabel('t'),ylabel('P'),title('P vs T');

%The values of , Pt, T, and P are displayed
T2
Pt
T
P
%The slpfield function is called, with inputs on boundaries of ti, tf, Pi,
%and M, where M is the Euler function.  
slpfield(ti,tf+2,0,M+5);
end