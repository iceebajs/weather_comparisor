function out = overallAssess(t,p, assess)
out = zeros(size(assess));

for n = 1:length(assess)
    if ~isnan(assess(n)) && isnumeric(p{n}) && isnumeric(t{n})
        out(n) = (p{n}+t{n}+assess(n))/3;
    elseif isnumeric(p{n}) && isnumeric(t{n})
        out(n) = (p{n}+t{n})/2;
    end
end
end

