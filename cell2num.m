function out = cell2num(in)
out = zeros(size(in));

for n = 1:length(out)
    out(n) = str2double(in{n});
end
end

