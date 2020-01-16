function assessment_t = temperature(fact_t,forecast_t)
assessment_t{length(fact_t),1} = {};
for n  = 1:length(forecast_t)
    if ~isnan(sum(forecast_t{n})) && ~isnumeric(forecast_t{n})
        forecast_t{n} = str2num(strrep(forecast_t{n},',','.'));
    end
end

for n = 1:length(fact_t)
    if ~isnan(sum(fact_t{n})) && ~isnumeric(fact_t{n})
        fact_t{n} = str2num(strrep(fact_t{n},',','.'));
    end
end

for n  = 1:length(fact_t)
    temp = NaN;
    if ~isnan(forecast_t{n})
        if length(forecast_t{n}) < 2
            assessment_t{n} = 'Ошибка';
            continue;
        else
            if ~isempty(fact_t{n}) && ~isempty(forecast_t{n})
                if forecast_t{n}(1) > forecast_t{n}(2)
                    tmp = forecast_t{n}(1);
                    forecast_t{n}(1) = forecast_t{n}(2);
                    forecast_t{n}(2) = tmp;
                end
                if fact_t{n} >= forecast_t{n}(1) && fact_t{n} <= forecast_t{n}(2)
                    assessment_t{n} = 100;
                    continue;
                elseif fact_t{n} <= forecast_t{n}(1)
                    temp = abs(fact_t{n}-forecast_t{n}(1));
                elseif fact_t{n} >= forecast_t{n}(2)
                    temp = abs(fact_t{n}-forecast_t{n}(2));
                end
            else
                assessment_t{n} = 'Ошибка';
                continue;
            end
        end
    end
    
    if temp <= 2
        assessment_t{n} = 100;
    elseif temp <= 3
        assessment_t{n} = 50;
    elseif isnan(temp)
        assessment_t{n} = '';
    else
        assessment_t{n} = 0;
    end
end

end