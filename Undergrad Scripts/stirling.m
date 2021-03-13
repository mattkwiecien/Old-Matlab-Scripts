function [ Nbang ] = stirling( N,q )
% Uses Stirling's factorial approximation for N as a large number


Nbang=N.^N.*exp(-N).*(2*pi*N).^(1/2);


end

