function assessment_t = temperature(fact_t,forecast_t)

assessment_t{length(fact_t),1} = {};

for n  = 1:length(fact_t)
    temp = abs(fact_t{n}-forecast_t{n});
    if  temp <= 2
        assessment_t{n} = 100;
    elseif temp <= 3
        assessment_t{n} = 50;
    elseif isnan(temp)
        assessment_t{n} = 'NaN';
    else
        assessment_t{n} = 0;
    end
end

end