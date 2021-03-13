function myodesolver(ti,tf,Pi,dt)
P(1)=Pi
Pnew=Pi
index=1

for t=ti:dt:tf
    
    index=index+1
    
    M=eulerfun(t,Pnew,dt)
    
    P(index)=M
    
    T(index)=t+dt
    Pnew=M
end


end