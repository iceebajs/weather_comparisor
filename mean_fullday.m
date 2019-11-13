function out = mean_fullday(in0, in1)
out = cell(size(in0));
for n = 1:length(in0)
    out{n} = mean([str2double(in0{n}), str2double(in1{n})]);
    
    if isnan(out{n})
        out{n} = '';
    else
        out{n} = num2str(out{n},3);
    end
end
end
