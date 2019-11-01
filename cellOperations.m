function out = cellOperations(param, cellArr0, cellArr1)
out = cell(1,1);
try
    if nargin == 2
        if strcmp(param, 'mean')
            temp = zeros(size(cellArr0));
            for n = 1:length(cellArr0)
                if ~isempty(cellArr0{n})
                    temp(n) = str2num(cellArr0{n});
                else
                    temp(n) = NaN;
                end
            end
            nanLogical = isnan(temp);
            temp(nanLogical) = [];
            out{1} = num2str(mean(temp),3);
        elseif strcmp(param, 'sqrt')
            if ~isempty(cellArr0{1})
                out{1} = num2str(sqrt(str2double(cellArr0{1})), 3);
            end
        end
    elseif nargin == 3
        if strcmp(param, 'divide')
            if ~isempty(cellArr0{1}) && ~isempty(cellArr1{1})
                out{1} = num2str(str2double(cellArr0{1})/str2double(cellArr1{1}),3);
            end
        elseif strcmp(param, 'corr')
            temp0 = zeros(size(cellArr0));
            temp1 = zeros(size(cellArr1));
            for n = 1:length(cellArr0)
                if ~isempty(cellArr0{n}) && ~isempty(cellArr1{n})
                    temp0(n) = str2num(cellArr0{n});
                    temp1(n) = str2num(cellArr1{n});
                else
                    temp0(n) = NaN;
                    temp1(n) = NaN;
                end
            end
            nanLogical0 = isnan(temp0);
            nanLogical1 = isnan(temp1);
            temp0(nanLogical0) = [];
            temp1(nanLogical1) = [];
            out{1} = num2str(corr2(temp0, temp1), 3);
        end
    end
catch
    out{1} = 'Ошибка';
end
end

