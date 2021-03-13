function [ynext]= eulerfun(t,y,deltat)


ynext=y+dfun(t,y)*deltat
