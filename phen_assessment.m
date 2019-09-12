function assessment = phen_assessment(wind, phen_fore, phen_fact)
temp = cell(size([wind,phen_fore]));
assessment = zeros(length(temp(:,1)),1);
temp(:,1) = wind;
for j = 2:length(phen_fore(1,:))+1
    for i = 1:length(phen_fore(:,1)) 
        if isempty(phen_fact{i,j-1})
            phen_fact{i,j-1} = NaN;
        end
        if isempty(phen_fore{i,j-1})
            phen_fore{i,j-1} = NaN;
        end
        
        if ~isnan(phen_fore{i,j-1}) && ~isnan(phen_fact{i,j-1})
            temp{i,j} = 100;
        elseif ~isnan(phen_fore{i,j-1}) && isnan(phen_fact{i,j-1})
            temp{i,j} = 0;
        elseif isnan(phen_fore{i,j-1}) && ~isnan(phen_fact{i,j-1})
            temp{i,j} = 0;
        else
            temp{i,j} = NaN;
        end     
    end
end
clear i j wind phen_fore phen_fact

for i = 1:length(temp(:,1))
    x = temp(i,:);
    nanIndex = cell2mat(cellfun(@isnan, x, 'UniformOutput', false));
    x(nanIndex) = [];
    x = cell2mat(x);
    y = length(find(x, 100));
    z = y/length(x)*100;
    z = z - floor(z);
    
    if z < 0.5
        assessment(i) = floor(y/length(x)*100);
    else
        assessment(i) = ceil(y/length(x)*100);
    end
end

end

