function assessment_t = temperature(fact_t,forecast_t)
assessment_t{length(fact_t),1} = {};
try
    for n  = 1:length(forecast_t)
        if ~isnan(sum(forecast_t{n})) && ~isnumeric(forecast_t{n})
            forecast_t{n} = str2num(forecast_t{n});
        end
    end
    
    for n = 1:length(fact_t)
        if ~isnan(sum(fact_t{n})) && ~isnumeric(fact_t{n})
            fact_t{n} = str2num(fact_t{n});
        end
    end
    
    for n  = 1:length(fact_t)
        temp = NaN;
        if ~isnan(forecast_t{n})
            if length(forecast_t{n}) < 2
                assessment_t{n} = 'Ошибка';
                continue;
            else
                if fact_t{n} <= forecast_t{n}(1)
                    temp = abs(fact_t{n}-forecast_t{n}(1));
                elseif fact_t{n} >= forecast_t{n}(2)
                    temp = abs(fact_t{n}-forecast_t{n}(2));
                elseif fact_t{n} > forecast_t{n}(1) && fact_t{n} < forecast_t{n}(2)
                    assessment_t{n} = 100;
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
catch
    assessment_t{n} = 'Крит.ошибка расчета данной точки';
end

end