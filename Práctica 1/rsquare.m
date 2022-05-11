function r2 = rsquare(real, pred)
SSE = sum((pred - mean(real)).^2);
SST = sum((real - mean(real)).^2);
r2 = SSE / SST;
end