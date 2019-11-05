function out = phen_gulka(phenomenons)
out = cell(length(phenomenons(:,1)),1);

for n = 1:length(phenomenons(:,1))
    temporary = 0;
    for nx = 1:length(phenomenons(1,:))
        if isempty(phenomenons{n,nx})
            temporary = temporary + 1;
        end
    end
    
    if temporary == 24
        out{n} = 'отрицательный';
    else
        temp0 = phenomenons(n,1:length(phenomenons(1,:))/2);
        temp1 = phenomenons(n,length(phenomenons(1,:))/2+1:end);
        res = zeros(size(temp0));
        for nx = 1:length(temp0)
            if ~isempty(temp0{nx}) && ~isempty(temp1{nx})
                res(nx) = 1;
            elseif ~isempty(temp0{nx}) && isempty(temp1{nx})
                res(nx) = 2;
            elseif isempty(temp0{nx}) && ~isempty(temp1{nx})
                res(nx) = 3;
            end
        end   
        
        if sum(res == 1) ~= 0 && sum(res == 2) ~=0 || sum(res == 1) ~=0 && sum(res == 3) ~= 0 || ...
                sum(res == 2) ~=0 && sum(res == 3) ~= 0
            out{n} = 'пропуск';
        elseif sum(res == 1) ~= 0
            out{n} = 'совпадение';
        elseif sum(res == 2) ~= 0
            out{n} = 'пропуск';
        elseif sum(res == 3) ~= 0
            out{n} = 'ложная тревога';   
        else
            out{n} = 'отрицательный';
        end
    end
end


end

