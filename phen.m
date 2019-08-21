function [assessment_phenomen, fact_phen, forecast_phen] = phen(fact_wind_n,forecast_wind_n)
assessment_phenomen{length(fact_wind_n),1} = {};


assessment_wind{length(fact_wind_n),1} = {};
for n  = 1:length(fact_wind_n)
    if  fact_wind_n{n} >= 15 && forecast_wind_n{n} >= 15 ||fact_wind_n{n} < 15 && forecast_wind_n{n} < 15
        assessment_wind{n} = 100;
    else
        assessment_wind{n} = 0;
    end
end

end

