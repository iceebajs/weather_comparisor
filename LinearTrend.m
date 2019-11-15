function p = LinearTrend(x, y)
n = length(x);
a = (sum(x .* y) - sum(x) * sum(y) / n) / (sum(x .* x) - sum(x)^2 / n);
b = (sum(y) - a * sum(x)) / n;
p = [a, b];

end