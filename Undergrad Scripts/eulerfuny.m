function [ynext]=eulerfuny(Ynew,Vnew,dt)
%Eulerfun calculates 1 step in the Euler function given the inputs Ynew,
%Vnew, and dt.
%The function which 1 step is calculated for is input in the dfuny.m file.
ynext=Ynew+(dfuny(Vnew)*dt);
end
