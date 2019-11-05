function out = prec_gulka(fact, forecast,fact_t, t_lim)
out = cell(size(fact));

for n  = 1:length(fact)
    if ~isnan(sum(fact{n})) && ~isnumeric(fact{n})
        fact{n} = erase(fact{n},'<');
        fact{n} = strrep(fact{n},',','.');
    end
end

forecast = str2double(forecast);
fact = str2double(fact);
fact_t = str2double(fact_t);

for n = 1:length(forecast)
    switch forecast(n)
        case 1
            if isnan(fact_t(n)) || isempty(fact_t(n))
                out{n} = 'Ќет температуры';
            else
                if fact_t(n) > t_lim
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) < 0.6
                        out{n} = 'совпадение';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                else
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) < 0.5
                        out{n} = 'совпадение';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                end
            end
        case 2
            if isnan(fact_t(n)) || isempty(fact_t(n))
                out{n} = 'Ќет температуры';
            else
                if fact_t(n) > t_lim
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) >= 0.1 && fact(n) < 10
                        out{n} = 'совпадение';
                    elseif fact(n) == 0
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                else
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) >= 0.1 && fact(n) < 5
                        out{n} = 'совпадение';
                    elseif fact(n) == 0
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                end
            end
        case 3
            if isnan(fact_t(n)) || isempty(fact_t(n))
                out{n} = 'Ќет температуры';
            else
                if fact_t(n) > t_lim
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) > 0.1 && fact(n) < 30
                        out{n} = 'совпадение';
                    elseif fact(n) == 0
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                else
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) >= 0.1 && fact(n) < 15
                        out{n} = 'совпадение';
                    elseif fact(n) == 0
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                end
            end
        case 4
            if isnan(fact_t(n)) || isempty(fact_t(n))
                out{n} = 'Ќет температуры';
            else
                if fact_t(n) > t_lim
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) >= 7 && fact(n) < 50
                        out{n} = 'совпадение';
                    elseif fact(n) < 7
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                else
                    if isempty(fact(n)) || isnan(fact(n))
                        out{n} = '';
                    elseif fact(n) >= 3 && fact(n) < 20
                        out{n} = 'совпадение';
                    elseif fact(n) < 3
                        out{n} = 'пропуск';
                    else
                        out{n} = 'ложна€ тревога';
                    end
                end
            end
        otherwise
            out{n} = '';
    end    
end

end

