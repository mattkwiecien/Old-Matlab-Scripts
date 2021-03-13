function ans = EulerMaruyama
% EulerMaruyama Solves SDE using Euler-Maruyama method.
%
% SDE is set to dX = lambda*X dt + mu*X dW, X(0) = Xzero
% where lambda = 2, mu =1, .

% Discretized Brownian path over [0,1] has dt = 2^(-8).
% Euler-Maruyama uses timestep R*dt.

L = 2; 
C = 2; 
R = .5;                         % RLC info

w = 1.5; 
sigma = 0.25;                   % Parameters of solution

T = 1; 
N = 2^8; 
dt = 1/N;

dW = sqrt(dt)*randn(1,N);       % creating the brownian motion
J = 4; 
Dt = J*dt; 
length = N/J;                   % R is j, tau is Dt, 

Izero = 1;
Iem = zeros(1,length);          % length of discretization
Itemp = Izero;                  % initial condition

Qzero = 1;
Qem = zeros(1,length);
Qtemp = Qzero;

t_volt = linspace(0,Dt,T);
V = sin(w.*t_volt);

for j = 1:length
    
   dW_sum = sum(dW(J*(j-1)+1:J*j)); % winc is brownian motion 
   
   Qtemp = Qtemp + Dt*Itemp;                          %Eulers method
   Itemp = Itemp + ((-R/L)*Itemp - (1/(L*C))*Qtemp)*Dt
   
   Qem(j) = Qtemp;
   Iem(j) = Itemp; % solution at that point in time, stored
   
end

plot([0:Dt:T],[Izero,Iem],'r--*')
xlabel('t','FontSize',12)
ylabel('X','FontSize',16)

ans = [Izero,Iem];
end

