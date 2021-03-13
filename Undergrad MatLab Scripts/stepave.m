function [ steptot ] = stepave( N,q )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
stepave=zeros(1);

for i=1:q
    stepave(i)=step(N);
end

steptot = sum(stepave) / q;


end

