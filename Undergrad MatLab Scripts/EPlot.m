function [ outvec ] = EPlot( Na, Nb, q )


[T,~,~,~] = TESM(Na,Nb,q);

qveca = T(:,1);
qvecb = T(:,3);
oveca = T(:,2);
ovecb = T(:,4);
oProductvec = T(:,5);

sa=log(oveca);
sb=log(ovecb);
st=log(oProductvec);

[Smax,MaxLoc] = max(st);

dSa=derivative(qveca,sa,MaxLoc);
dSb=derivative(qveca,sb,MaxLoc);
dSt=derivative(qveca,st,MaxLoc);

plot(qveca,sa,qveca,sb,qveca,st)

qveca(MaxLoc)

outvec=[dSa dSb dSt qveca(MaxLoc) Smax];

end

