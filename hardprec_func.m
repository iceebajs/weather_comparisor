function assessment_hardprec = hardprec_func(fact,forecast,snow_or_rain)

assessment_hardprec{length(fact),1} = {};
for n = 1:length(fact)
    if 0.30*fact{n} >= abs(fact-forecast)
        assessment_hardprec{n} = 100;
    elseif isnan(fact{n}) || isnan(forecast{n})
        assessment_hardprec{n} = 'NaN';
    else
        assessment_hardprec{n} = 0;
    end
end

end

