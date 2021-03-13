function ans = RLC_EM
% EulerMaruyama Solves SDE using Euler-Maruyama method.
%
% SDE is set to dX = lambda*X dt + mu*X dW, X(0) = Xzero
% where lambda = 2, mu =1, .

% Discretized Brownian path over [0,1] has dt = 2^(-8).
% Euler-Maruyama uses timestep R*dt.

L = 2; C = 2; R = .5;                         % RLC info

w = 1.5; sigma = .25;                   % Parameters of solution

T = 10; N = 2^6; dt = 1/N;

dW = sqrt(dt)*randn(1,N);       % creating the brownian motion
J = 4; Dt = J*dt; len = N/J;                   % R is j, tau is Dt, 


Izero = 1;
Iem = zeros(1,len);% length of discretization
Iem2 = zeros(1,len);
Itemp = Izero;                  % initial condition
Itemp2 = Izero;

Qzero = 1;
Qem = zeros(1,len);
Qem2 = zeros(1,len);
Qtemp = Qzero;
Qtemp2 = Qzero;

t_volt = [0:Dt:T];
V = sin(w.*t_volt);

for j = 1:len
    
   dW_sum = sum(dW(J*(j-1)+1:J*j)); % winc is brownian motion 
   
   Qtemp = Qtemp + Dt*Itemp;                          %Eulers method
   Itemp = Itemp + ( (-R/L)*Itemp - (1/(L*C))*Qtemp + V(j)/L )*Dt + (sigma/L)*dW_sum;
   
   Qem(j) = Qtemp;
   Iem(j) = Itemp; % solution at that point in time, stored
   
end
for i = 1:len
       
   Qtemp2 = Qtemp2 + Dt*Itemp2;                          %Eulers method
   Itemp2 = Itemp2 + ((-R/L)*Itemp2 - (1/(L*C))*Qtemp2 + V(i)/L)*Dt;
   
   Qem2(i) = Qtemp2;
   Iem2(i) = Itemp2; % solution at that point in time, stored
   
end

figure
whos
plot([0:Dt:T],[Izero,Iem],'r--*')
hold on
plot([0:Dt:T],[Qzero,Qem],'b--*')
title('Random')

figure
plot([0:Dt:T],[Izero,Iem2],'r--*')
hold on
plot([0:Dt:T],[Qzero,Qem2],'b--*')
title('No Random')

end

