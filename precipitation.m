function assessment_p = precipitation(fact_p,forecast_p, fact_t, t_lim)

assessment_p{length(fact_p),1} = {};

for n  = 1:length(fact_p)
    if ~isnan(sum(fact_p{n})) && ~isnumeric(fact_p{n})
        fact_p{n} = erase(fact_p{n},'<');
        fact_p{n} = strrep(fact_p{n},',','.');
    end
    %{
    if ~isnan(sum(forecast_p{n})) && ~isnumeric(forecast_p{n})
        forecast_p{n} = erase(forecast_p{n},'<');
        forecast_p{n} = strrep(forecast_p{n},',','.');
    end
    %}
end

for n  = 1:length(fact_t)    
    if ~isnan(sum(fact_t{n})) && ~isnumeric(fact_t{n})
        fact_t{n} = str2num(fact_t{n});
    end
end

clear n


for n  = 1:length(fact_p)
    if isnumeric(fact_p{n})
        p1 = fact_p{n};
    else
        p1 = str2double(fact_p{n});
    end
    
    if isnumeric(forecast_p{n})
        p2 = forecast_p{n};
    else
        p2 = str2double(forecast_p{n});
    end
    
    if isnan(p1) || isnan(p2)
        assessment_p{n} = NaN;
    elseif isnan(sum(fact_t{n})) || isempty(fact_t{n})
        assessment_p{n} = 'Нет температуры';
    elseif fact_t{n} > t_lim
        if p2 == 1
            if p1 >= 0 && p1 <= 0.3
                assessment_p{n} = 100;
            elseif p1 > 0.3 && p1 <= 0.5
                assessment_p{n} = 50;
            else %if p1 > 0.5
                assessment_p{n} = 0;
            end
        elseif p2 == 2
            if p1 >= 0.1 && p1 <= 3
                assessment_p{n} = 100;
            elseif p1 > 3 && p1 <= 9
                assessment_p{n} = 50;
            else %if p1 > 9 || p1 == 0
                assessment_p{n} = 0;
            end
        elseif p2 == 3
            if p1 >= 0.4 && p1 <= 14
                assessment_p{n} = 100;
            elseif p1 > 14 && p1 <= 29 || p1 >= 0.1 && p1 <= 0.3
                assessment_p{n} = 50;
            else %if p1 > 29 || p1 == 0
                assessment_p{n} = 0;
            end
        elseif p2 == 4
            if p1 >= 10 && p1 <= 49
                assessment_p{n} = 100;
            elseif p1 >= 7 && p1 <= 9
                assessment_p{n} = 50;
            else %if p1 < 7 || p1 >=50
                assessment_p{n} = 0;
            end
        else
            assessment_p{n} = NaN;
        end
    else
        if p2 == 1
            if p1 >= 0 && p1 <= 0.2
                assessment_p{n} = 100;
            elseif p1 > 0.2 && p1 <= 0.4
                assessment_p{n} = 50;
            else %if p1 > 0.4
                assessment_p{n} = 0;
            end
        elseif p2 == 2
            if p1 >= 0.1 && p1 <= 2
                assessment_p{n} = 100;
            elseif p1 > 2 && p1 <= 4
                assessment_p{n} = 50;
            else %if p1 > 4 || p1 == 0
                assessment_p{n} = 0;
            end
        elseif p2 == 3
            if p1 >= 0.3 && p1 <= 6
                assessment_p{n} = 100;
            elseif p1 > 6 && p1 <= 14 || p1 >= 0.1 && p1 <= 0.2
                assessment_p{n} = 50;
            else %if p1 > 14 || p1 == 0
                assessment_p{n} = 0;
            end
        elseif p2 == 4
            if p1 >= 5 && p1 <= 19
                assessment_p{n} = 100;
            elseif p1 >= 3 && p1 <= 4
                assessment_p{n} = 50;
            else %if p1 < 3 || p1 >=20
                assessment_p{n} = 0;
            end
        else
            assessment_p{n} = NaN;
        end
    end
end

end