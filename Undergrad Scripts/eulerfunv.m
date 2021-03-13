function [vnext]=eulerfunv(Ynew,Vnew,dt,m,k,b)
%Eulerfun calculates 1 step in the Euler function given the inputs Ynew,
%Vnew, dt, m, k, and b.
%The function which 1 step is calculated for is input in the dfunv.m file.
vnext=Vnew+(dfunv(Ynew,Vnew,m,k,b)*dt);
end
