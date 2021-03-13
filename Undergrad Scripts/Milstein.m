function ans = Milstein
% EulerMaruyama Solves SDE using Euler-Maruyama method.
%
% SDE is set to dX = lambda*X dt + mu*X dW, X(0) = Xzero
% where lambda = 2, mu =1, Xzero = 1.

% Discretized Brownian path over [0,1] has dt = 2^(-8).
% Euler-Maruyama uses timestep R*dt.

lambda = 2; mu = 1; Xzero = 1;  % parameters of SDE
T = 1; N = 2^8; dt = 1/N;       % Parameters of solution

dW = sqrt(dt)*randn(1,N);       % creating the brownian motion
R = 4; Dt = R*dt; L = N/R;      % R is j, tau is Dt, 
r=2; K=1; beta=1;

Xem = zeros(1,L);               % length of discretization
Xtemp = Xzero;                  % initial condition

for j = 1:L
    
   Winc = sum(dW(R*(j-1)+1:R*j)); % winc is brownian motion 
   Xtemp = Xtemp + (r*Xtemp*(K-Xtemp)) + (beta*Xtemp*Winc) + (1/2)*beta*Xtemp*beta*(Winc^2 - dt);
   %solution at that step
   Xem(j) = Xtemp; % solution at that point in time, stored

end

% plot([0:Dt:T],[Xzero,Xem],'r--*')
% xlabel('t','FontSize',12)
% ylabel('X','FontSize',16)

ans = [Xzero,Xem];
end

