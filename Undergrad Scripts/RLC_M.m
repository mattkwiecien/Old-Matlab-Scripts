function  RLC_M

L = 2; C = 2; R = .5;                         % RLC info
w = 1.5; sigma = 7.5;                   % Parameters of solution
T = 1; N = 2^6; dt = 1/N;

dW = sqrt(dt)*randn(1,N);                % creating the brownian motion
J = 4; Dt = J*dt; len = N/J;                   % R is j, tau is Dt, 

Izero = 1;
Iem = zeros(1,len);             % length of discretization
Itemp = Izero;                  % initial condition

Qzero = 1;
Qem = zeros(1,len);
Qtemp = Qzero;

t_volt = [0:Dt:T];
V = sin(w.*t_volt);

for j = 1:len
    
   dW_sum = sum(dW(J*(j-1)+1:J*j)); % winc is brownian motion 
   
   Qtemp = Qtemp + Dt*Itemp;                          %Eulers method
   Itemp = Itemp + ((-R/L)*Itemp - (1/(L*C))*Qtemp + V(j)/L)*Dt + (sigma/L)*dW_sum;
   
   Qem(j) = Qtemp;
   Iem(j) = Itemp; % solution at that point in time, stored
   
end

figure
plot([0:Dt:T],[Izero,Iem],'r--*')
hold on
plot([0:Dt:T],[Qzero,Qem],'b--*')
title('Random')


end
end

