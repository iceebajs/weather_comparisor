function [x, f] = calcRegression(in0, in1)
temp = isnan(in0);
in0(temp) = [];
in1(temp) = [];

N = length(in0);
X = [ones(N,1) in0];
a = (X.' * X)\(X.'*in1(:));

b = a(1);
m = a(2);
xa = min(in0);
xb = max(in0);
x = linspace(xa, xb, 100);
f = b + m*x;
end

