function [ row , column, prob, finalState  ] = QS2( A,B,state )
%function will take two operators, A and B, and initial state, and find the
%possible values and probabilities of obtaining those values after
%measurement by A and B

%preallocation
probB=zeros(length(state));

%finds probabilities, eigenvalues and eigenstates of our operators
[probA, resultA, stateA]=QuantumState(state, A);

for n=1:1:length(state)
    [probB(:,n), resultB, stateB]=QuantumState(stateA(:,n), B);
end

%creates a matrix out of our possible results
row=meshgrid(resultA);
column=meshgrid(resultB)';

%finds the probabilities of getting available results after second
%measurement
prob = meshgrid(probA).*probB;

%final state
finalState=stateB;

end

