function [ynext]= eulerfun(t,y,deltat)
%Eulerfun calculates 1 step in the Euler function given the inputs t, y,
%and delta t.
%The function which 1 step is calculated for is input in the dfun.m file.

ynext=y+dfun(t,y)*deltat
