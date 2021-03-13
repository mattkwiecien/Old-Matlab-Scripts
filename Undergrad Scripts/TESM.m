function [ outputtable, MostProb, LeastProb, omegasum ] = TESM( NA, NB, qtot )
% Coupled Einstein Solids
% By Matt, Treavor, and Cordell

omegaA=zeros(qtot+1,1);
omegaB=zeros(qtot+1,1);
qvecA=zeros(qtot+1,1);
qvecB=zeros(qtot+1,1);

omegaTot=zeros(qtot+1,1);

for i = 1:(qtot+1)
    qvecA(i)=i-1;
    qvecB(i)=qtot-i+1;
    
    omegaA(i)=ESM(NA,qvecA(i));
    omegaB(i)=ESM(NB,qvecB(i));
    
    omegaTot(i)=omegaA(i)*omegaB(i);
    
end

outputtable=[qvecA omegaA qvecB omegaB omegaTot];

figure(1)
bar(qvecA,omegaTot)
xlabel('qA')
ylabel('Multiplicity')
omegasum = sum(omegaTot);


[~,linIndexMax] = max(omegaTot);
[~,linIndexMin] = min(omegaTot);
[MostProb,~] = ind2sub(size(omegaTot),linIndexMax(1));
[LeastProb,~] = ind2sub(size(omegaTot),linIndexMin(1));


end

