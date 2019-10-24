function out = nanClean(input)
if (~iscell(input))
    input = num2cell(input);
end
for n = 1:length(input)
    if(isnan(input{n}))
        input{n} = ' ';
    end
end
out = input;
end

