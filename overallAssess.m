function out = overallAssess(t,p, assess)
out = zeros(size(assess));

for n = 1:length(assess)
    if ~isnan(assess(n)) && isnumeric(p{n}) && isnumeric(t{n})
        z = (p{n}+t{n}+assess(n))/3;
        z = z - floor(z);
        
        if z < 0.5
            out(n) = floor((p{n}+t{n}+assess(n))/3);
        else
            out(n) = ceil((p{n}+t{n}+assess(n))/3);
        end
    elseif isnumeric(p{n}) && isnumeric(t{n})
        z = (p{n}+t{n})/2;
        z = z - floor(z);
        
        if z < 0.5
            out(n) = floor((p{n}+t{n})/2);
        else
            out(n) = ceil((p{n}+t{n})/2);
        end
    else
        out(n) = NaN;
    end
end


end

