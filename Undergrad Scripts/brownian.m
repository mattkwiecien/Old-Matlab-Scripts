T = 1;  N = 500;    dt = T/N;

dw = sqrt(dt)*randn(1,N);
wt = cumsum(dw);


stratsum = 0;
itosum = 0;

for i=1:N-1
    itosum = (wt(i) * dw(i)) + itosum;
end

itosum

    