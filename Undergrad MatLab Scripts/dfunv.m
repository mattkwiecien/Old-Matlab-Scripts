function Vprime=dfunv(Ynew,Vnew,m,k,b)
%Right hand side of O.D.E. dY/dt=. Below is dY/dt=(-(b/m)*Vnew) +
%(-(k/m)*Ynew).  The parameters of the equation 'm', 'k', and 'b', are user
%input unique to each O.D.E.
Vprime=(-(b/m)*Vnew) + (-(k/m)*Ynew);
end
