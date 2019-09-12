function out = nanClean(input)
for n = 1:length(input)
    if(isnan(input{n}))
        input{n} = ' ';
    end
end
out = input;
end

