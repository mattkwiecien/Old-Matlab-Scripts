function [ omega ] = ESM( N,q )
%This function calculates and returns the multiplicity of a Einstein Solid Model given
%input of N and q, where N is the number of oscillators and q is the energy
%unit of h*f.

if q == 0
    omega = 1;
elseif N < 30 && q < 30
    omega = ( factorial( q + N - 1) ./ (factorial(q) .* factorial( N - 1 ) ) );
else
   omega= (((q+N)/q)^q*((q+N)/N)^N)/sqrt(2*pi*q*(q+N)/N);
end

