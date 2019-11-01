function out = forecast_t_mean(in)
out = cell(size(in));
for n = 1:length(in)
    out{n} = mean(str2num(in{n}));
    
    if isnan(out{n})
        out{n} = '';
    else
        out{n} = num2str(out{n},3);
    end
end
end

