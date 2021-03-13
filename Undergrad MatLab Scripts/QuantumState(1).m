function [ probability, results, states ] = QuantumState( state, operator )

%checks if input state is row or column, if row converts to column
if isrow(state)==1
    state=state';
end

%normalizes state
norm = (state'*state)^(1/2);
normState= (1/norm).*state;

%finds eigenstates and eigenvectors of operator
[states,results] = eig(operator);
results = eig(results);

%preallocation
q=length(results);
probability = zeros(1,q);

%Calculates probabilities of respective values
for n=1:1:q   
    probability(n) = abs((states(:,n)'*normState))^2;   
end

end

