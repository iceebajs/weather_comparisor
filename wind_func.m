function assessment_wind = wind_func(fact_wind_n,forecast_wind_n)

assessment_wind{length(fact_wind_n),1} = {};

for n  = 1:length(fact_wind_n)
%     if isempty(fact_wind_n{n}) || ~isnumeric(fact_wind_n{n})
%         fact_wind_n{n} = NaN;
%     end
%     if isempty(forecast_wind_n{n}) || ~isnumeric(forecast_wind_n{n})
%         forecast_wind_n{n} = NaN;
%     end
    
    if 0.25*fact_wind_n{n} >=  abs(fact_wind_n{n}-forecast_wind_n{n})
        assessment_wind{n} = 100;
    elseif isempty(fact_wind_n{n}) || isempty(forecast_wind_n{n})
        assessment_wind{n} = '';
    elseif isnan(fact_wind_n{n}) || isnan(forecast_wind_n{n})
        assessment_wind{n} = NaN;
    else
        assessment_wind{n} = 0;
    end    
end

end

