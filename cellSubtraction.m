function out = cellSubtraction(cellArr1, cellArr0, str)
out = cell(size(cellArr0));
for n = 1:length(cellArr0)    
    if nargin == 3
        if strcmp(str, 'abs')
            out{n} = abs(str2double(cellArr1{n}) - str2double(cellArr0{n}));
            if isnan(out{n})
                out{n} = '';
            else
                out{n} = num2str(out{n},3);
            end
        elseif strcmp(str, 'immse/2')
            out{n} = immse(str2double(cellArr1{n}), str2double(cellArr0{n}))/2;
            if isnan(out{n})
                out{n} = '';
            else
                out{n} = num2str(out{n},4);
            end
        end
    else
        out{n} = str2double(cellArr1{n}) - str2double(cellArr0{n});
        if isnan(out{n})
            out{n} = '';
        else
            out{n} = num2str(out{n},3);
        end
    end
end
end

