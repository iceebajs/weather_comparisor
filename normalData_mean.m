function out = normalData_mean(normData, date)
out = cell(length(normData(:,1)),1);

if date(1) < 15
    for n = 1:length(out)
        if date(2) == 1
            out{n} = mean([normData{n,date(2)+2}, normData{n,14}]);            
        else
            out{n} = mean([normData{n,date(2)+2}, normData{n,date(2)+1}]);
        end
        
        if isnan(out{n})
            out{n} = '';
        else
            out{n} = num2str(out{n},3);
        end
    end
else
    for n = 1:length(out)
        if date(2) == 12
            out{n} = mean([normData{n,date(2)+2}, normData{n,3}]);
        else
            out{n} = mean([normData{n,date(2)+2}, normData{n,date(2)+3}]);
        end
        
        if isnan(out{n})
            out{n} = '';
        else
            out{n} = num2str(out{n},3);
        end
    end
end

end

