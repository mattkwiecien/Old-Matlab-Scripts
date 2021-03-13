function Pprime=dfun(t,P)
%Right hand side of O.D.E. dP/dt=. Below is dP/dt=k*P*[1-P/N]
k=2;
N=10;

Pprime=k*P*[1-P/N]

