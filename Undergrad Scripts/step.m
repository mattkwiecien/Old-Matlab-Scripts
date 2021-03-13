function [ dist ] = step( N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dist = 0;

for i=1:N
    a=rand;
    if a>.5
        dist=dist+1;
    elseif a<.5
        dist=dist-1;
    end
end


end

