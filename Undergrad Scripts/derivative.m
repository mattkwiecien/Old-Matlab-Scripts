function [ derivative ] = derivative( x,y,Loc )



derivative=(((y(Loc)-y(Loc+1))/(x(Loc)-x(Loc+1)))+((y(Loc)-y(Loc-1))/(x(Loc)-x(Loc-1))))/2;


end

