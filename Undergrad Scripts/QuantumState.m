function [ results, probability, states ] = QuantumState( operator, state )
%This function outputs the possible results with their respective
%probability and eigenstates for a given operator and eigenstate

norm = 1/sqrt(state'*state)

normState = norm.*state;

[states,results]=eig(operator);
%results=eig(results);
q=length(results);

probability = zeros(1,q);

for n=1:1:q
    
    probability(n) = abs((states(:,n)'*normState))^2;
    
end

probability = transpose(probability);

end