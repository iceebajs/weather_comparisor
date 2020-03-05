function [night_assessment, day_assessment, assessment_fullday, territorial_assessment,...
    calc_table, calc_table_p, calc_table_phen, fact_t_n] = ...
    func_loadButton(night_assessment, day_assessment,...
    assessment_fullday, territorial_assessment, calc_table, calc_table_p, calc_table_phen, normData, t_lim, fileDate, data)

    % =============================== night ===================================
    % =========================================================================
    if nargin == 11
        stations = table2cell(data(4:68,2));
        phenomenons = table2cell(data(2,9:20));
        
        fact_t_n = table2cell(data(4:68,3));
        forecast_t_n = table2cell(data(4:68,4));
        t_night = temperature(fact_t_n, forecast_t_n);
        
        fact_p_n = table2cell(data(4:68,6));
        forecast_p_n = table2cell(data(4:68,7));
        p_night = precipitation(fact_p_n, forecast_p_n, fact_t_n, t_lim);
        
        %==================== phenomenons =========================================
        forecast_wind_n = num2cell(str2double(table2cell(data(4:68,21))));
        fact_wind_n = num2cell(str2double(table2cell(data(4:68,9))));
        wind_night = wind_func(fact_wind_n, forecast_wind_n);
        
        phen_fore_n = table2cell(data(4:68,22:32));
        phen_fact_n = table2cell(data(4:68,10:20));
        assessment_night = phen_assessment(wind_night, phen_fore_n, phen_fact_n);
        
        overall_assessment_night = overallAssess(t_night,p_night,assessment_night);
        % =============================== day =====================================
        % =========================================================================
        
        fact_t_d = table2cell(data(4:68,37));
        forecast_t_d = table2cell(data(4:68,38));
        t_day = temperature(fact_t_d, forecast_t_d);
        
        fact_p_d = table2cell(data(4:68,40));
        forecast_p_d = table2cell(data(4:68,41));
        p_day = precipitation(fact_p_d, forecast_p_d, fact_t_d, t_lim);
        
        %==================== phenomenons =========================================
        fact_wind_d = num2cell(str2double(table2cell(data(4:68,43))));
        forecast_wind_d = num2cell(str2double(table2cell(data(4:68,55))));
        wind_day = wind_func(fact_wind_d, forecast_wind_d);
        
        phen_fore_d = table2cell(data(4:68,56:66));
        phen_fact_d = table2cell(data(4:68,44:54));
        assessment_day = phen_assessment(wind_day, phen_fore_d, phen_fact_d);
        
        overall_assessment_day = overallAssess(t_day,p_day, assessment_day);
        
    elseif nargin == 10        
        fact_t_n = night_assessment(4:68,3);
        forecast_t_n = night_assessment(4:68,4);
        t_night = temperature(fact_t_n, forecast_t_n);
        
        fact_p_n = night_assessment(4:68,6);
        forecast_p_n = night_assessment(4:68,7);
        p_night = precipitation(fact_p_n, forecast_p_n, fact_t_n, t_lim);
        
        %==================== phenomenons =========================================
        forecast_wind_n = num2cell(str2double(night_assessment(4:68,21)));
        fact_wind_n = num2cell(str2double(night_assessment(4:68,9)));
        wind_night = wind_func(fact_wind_n, forecast_wind_n);
        
        phen_fore_n = night_assessment(4:68,22:32);
        phen_fact_n = night_assessment(4:68,10:20);
        assessment_night = phen_assessment(wind_night, phen_fore_n, phen_fact_n);
        
        overall_assessment_night = overallAssess(t_night,p_night,assessment_night);
        % =============================== day =====================================
        % =========================================================================
        
        fact_t_d = day_assessment(4:68,3);
        forecast_t_d = day_assessment(4:68,4);
        t_day = temperature(fact_t_d, forecast_t_d);
        
        fact_p_d = day_assessment(4:68,6);
        forecast_p_d = day_assessment(4:68,7);
        p_day = precipitation(fact_p_d, forecast_p_d, fact_t_d, t_lim);
        
        %==================== phenomenons =========================================
        forecast_wind_d = num2cell(str2double(day_assessment(4:68,21)));
        fact_wind_d = num2cell(str2double(day_assessment(4:68,9)));
        wind_day = wind_func(fact_wind_d, forecast_wind_d);
        
        phen_fore_d = day_assessment(4:68,22:32);
        phen_fact_d = day_assessment(4:68,10:20);
        assessment_day = phen_assessment(wind_day, phen_fore_d, phen_fact_d);
        
        overall_assessment_day = overallAssess(t_day,p_day, assessment_day);
    end
        
    
    % ============ NaN cleaner & main tables ==================================
    % =========================================================================
    % =============================== night ===================================
    % =========================================================================
    if nargin == 11
        night_assessment(4:end, 3) = fact_t_n;
        night_assessment(4:end, 4) = forecast_t_n;
        night_assessment(4:end, 6) = fact_p_n;
        night_assessment(4:end, 7) = forecast_p_n;
    end
    
    calc_table(3:end-7, 4) = fact_t_n;
    calc_table(3:end-7, 6) = forecast_t_mean(forecast_t_n);
    
    %==================== phenomenons =========================================
    forecast_wind_n = nanClean(forecast_wind_n);
    fact_wind_n = nanClean(fact_wind_n);
    for n = 1:length(phen_fore_n(1,:))
        phen_fore_n(:,n) = nanClean(phen_fore_n(:,n));
        phen_fact_n(:,n) = nanClean(phen_fact_n(:,n));
    end
    
    if nargin == 11
        night_assessment(4:end,2) = stations;
        day_assessment(4:end,2) = stations;
        assessment_fullday(3:end,2) = stations;
        calc_table(3:end-7, 2) = stations;
        calc_table_p(3:end-13, 2) = stations;
        calc_table_phen(3:end-13, 2) = stations;
        night_assessment(3,9:20) = phenomenons;
        night_assessment(3,21:32) = phenomenons;
        day_assessment(3,9:20) = phenomenons;
        day_assessment(3,21:32) = phenomenons;
        calc_table_phen(2,3:14) = phenomenons;
        calc_table_phen(2,15:26) = phenomenons;
        calc_table_phen(2,28:39) = phenomenons;
        calc_table_phen(2,40:51) = phenomenons;
    end
    
    night_assessment(4:end, 21) = forecast_wind_n;
    night_assessment(4:end, 9) = fact_wind_n;
    
    night_assessment(4:end, 22:32) = phen_fore_n;
    night_assessment(4:end, 10:20) = phen_fact_n;
    
    % =============================== day =====================================
    % =========================================================================
    if nargin == 11
        day_assessment(4:end, 3) = fact_t_d;
        day_assessment(4:end, 4) = forecast_t_d;
        day_assessment(4:end, 6) = fact_p_d;
        day_assessment(4:end, 7) = forecast_p_d;
    end
    
    calc_table(3:end-7, 11) = fact_t_d;
    calc_table(3:end-7, 13) = forecast_t_mean(forecast_t_d);
    
    %==================== phenomenons =========================================
    forecast_wind_d = nanClean(forecast_wind_d);
    fact_wind_d = nanClean(fact_wind_d);
    for n = 1:length(phen_fore_d(1,:))
        phen_fore_d(:,n) = nanClean(phen_fore_d(:,n));
        phen_fact_d(:,n) = nanClean(phen_fact_d(:,n));
    end
    
    day_assessment(4:end, 21) = forecast_wind_d;
    day_assessment(4:end, 9) = fact_wind_d;
    
    day_assessment(4:end, 22:32) = phen_fore_d;
    day_assessment(4:end, 10:20) = phen_fact_d;
    
    % =========================================================================
    % =========================================================================
    
    % ============= night_output ================================================
    % =========================================================================
    night_assessment(4:end,5) = t_night;
    night_assessment(4:end,8) = p_night;
    
    % =============== phenomenon assessment night ==============
    night_assessment(4:end,33) = nanClean(assessment_night);
    night_assessment(4:end,34) = nanClean(overall_assessment_night);
    assessment_fullday(3:end,3) = nanClean(overall_assessment_night);
    
    % ============= day_output ================================================
    % =========================================================================
    day_assessment(4:end,5) = t_day;
    day_assessment(4:end,8) = p_day;
    
    % =============== phenomenon assessment night ==============
    day_assessment(4:end,33) = nanClean(assessment_day);
    day_assessment(4:end,34) = nanClean(overall_assessment_day);
    assessment_fullday(3:end,4) = nanClean(overall_assessment_day);
    
    z = (overall_assessment_night+overall_assessment_day)/2;
    z = z - floor(z);
    
    if z < 0.5
        fullday_assess_pub = floor((overall_assessment_night+overall_assessment_day)/2);
    else
        fullday_assess_pub = ceil((overall_assessment_night+overall_assessment_day)/2);
    end
    assessment_fullday(3:end,5) = nanClean(fullday_assess_pub);
    
    % Minsk
    territorial_assessment(3,2) = assessment_fullday(25,4);
    territorial_assessment(4,2) = assessment_fullday(25,3);
    territorial_assessment(5,2) = assessment_fullday(25,5);
    
    territorial_assessment(3,3) = num2cell(terr_assess(overall_assessment_day(23:36)));
    territorial_assessment(4,3) = num2cell(terr_assess(overall_assessment_night(23:36)));
    territorial_assessment(5,3) = num2cell(terr_assess(fullday_assess_pub(23:36)));
    
    % Brest
    territorial_assessment(3,4) = assessment_fullday(48,4);
    territorial_assessment(4,4) = assessment_fullday(48,3);
    territorial_assessment(5,4) = assessment_fullday(48,5);
    
    territorial_assessment(3,5) = num2cell(terr_assess(overall_assessment_day(46:56)));
    territorial_assessment(4,5) = num2cell(terr_assess(overall_assessment_night(46:56)));
    territorial_assessment(5,5) = num2cell(terr_assess(fullday_assess_pub(46:56)));
    
    % Gomel
    territorial_assessment(3,6) = assessment_fullday(59,4);
    territorial_assessment(4,6) = assessment_fullday(59,3);
    territorial_assessment(5,6) = assessment_fullday(59,5);
    
    territorial_assessment(3,7) = num2cell(terr_assess(overall_assessment_day(57:65)));
    territorial_assessment(4,7) = num2cell(terr_assess(overall_assessment_night(57:65)));
    territorial_assessment(5,7) = num2cell(terr_assess(fullday_assess_pub(57:65)));
    
    % Mogilev
    territorial_assessment(3,8) = assessment_fullday(39,4);
    territorial_assessment(4,8) = assessment_fullday(39,3);
    territorial_assessment(5,8) = assessment_fullday(39,5);
    
    territorial_assessment(3,9) = num2cell(terr_assess(overall_assessment_day(37:45)));
    territorial_assessment(4,9) = num2cell(terr_assess(overall_assessment_night(37:45)));
    territorial_assessment(5,9) = num2cell(terr_assess(fullday_assess_pub(37:45)));
    
    % Vitebsk
    territorial_assessment(3,10) = assessment_fullday(3,4);
    territorial_assessment(4,10) = assessment_fullday(3,3);
    territorial_assessment(5,10) = assessment_fullday(3,5);
    
    territorial_assessment(3,11) = num2cell(terr_assess(overall_assessment_day(1:13)));
    territorial_assessment(4,11) = num2cell(terr_assess(overall_assessment_night(1:13)));
    territorial_assessment(5,11) = num2cell(terr_assess(fullday_assess_pub(1:13)));
    
    % Grodno
    territorial_assessment(3,12) = assessment_fullday(16,4);
    territorial_assessment(4,12) = assessment_fullday(16,3);
    territorial_assessment(5,12) = assessment_fullday(16,5);
    
    territorial_assessment(3,13) = num2cell(terr_assess(overall_assessment_day(14:22)));
    territorial_assessment(4,13) = num2cell(terr_assess(overall_assessment_night(14:22)));
    territorial_assessment(5,13) = num2cell(terr_assess(fullday_assess_pub(14:22)));
    
    % ============================= additional_assessment_table_temperature =========================
    calc_table(3:end-7,18) = mean_fullday(calc_table(3:end-7,4), calc_table(3:end-7,11));
    calc_table(3:end-7,20) = mean_fullday(calc_table(3:end-7,6), calc_table(3:end-7,13));
    calc_table(3:end-7,3) = normalData_mean(normData, fileDate);
    
    % ======== night ===============
    calc_table(3:end-7,5) = cellSubtraction(calc_table(3:end-7,4), calc_table(3:end-7,3));
    calc_table(3:end-7,7) = cellSubtraction(calc_table(3:end-7,6), calc_table(3:end-7,3));
    calc_table(3:end-7,8) = cellSubtraction(calc_table(3:end-7,4), calc_table(3:end-7,6));
    calc_table(3:end-7,9) = cellSubtraction(calc_table(3:end-7,4), calc_table(3:end-7,6), 'abs');
    calc_table(3:end-7,10) = cellSubtraction(calc_table(3:end-7,4), calc_table(3:end-7,6), 'immse/2');
    
    % ======== day =================
    calc_table(3:end-7,12) = cellSubtraction(calc_table(3:end-7,11), calc_table(3:end-7,3));
    calc_table(3:end-7,14) = cellSubtraction(calc_table(3:end-7,13), calc_table(3:end-7,3));
    calc_table(3:end-7,15) = cellSubtraction(calc_table(3:end-7,11), calc_table(3:end-7,13));
    calc_table(3:end-7,16) = cellSubtraction(calc_table(3:end-7,11), calc_table(3:end-7,13), 'abs');
    calc_table(3:end-7,17) = cellSubtraction(calc_table(3:end-7,11), calc_table(3:end-7,13), 'immse/2');
    
    % ======== fullday =============
    calc_table(3:end-7,19) = cellSubtraction(calc_table(3:end-7,18), calc_table(3:end-7,3));
    calc_table(3:end-7,21) = cellSubtraction(calc_table(3:end-7,20), calc_table(3:end-7,3));
    calc_table(3:end-7,22) = cellSubtraction(calc_table(3:end-7,18), calc_table(3:end-7,20));
    calc_table(3:end-7,23) = cellSubtraction(calc_table(3:end-7,18), calc_table(3:end-7,20), 'abs');
    calc_table(3:end-7,24) = cellSubtraction(calc_table(3:end-7,18), calc_table(3:end-7,20), 'immse/2');
    
    % ======== bottom table ========
    calc_table(71,3) = cellOperations('mean', calc_table(3:end-7,5));
    calc_table(72,3) = cellOperations('mean', calc_table(3:end-7,12));
    calc_table(73,3) = cellOperations('mean', calc_table(3:end-7,19));
    
    calc_table(71,4) = cellOperations('mean', calc_table(3:end-7,7));
    calc_table(72,4) = cellOperations('mean', calc_table(3:end-7,14));
    calc_table(73,4) = cellOperations('mean', calc_table(3:end-7,21));
    
    calc_table(71,5) = cellOperations('divide', calc_table(71,4), calc_table(71,3));
    calc_table(72,5) = cellOperations('divide', calc_table(72,4), calc_table(72,3));
    calc_table(73,5) = cellOperations('divide', calc_table(73,4), calc_table(73,3));
    
    calc_table(71,6) = cellOperations('mean', calc_table(3:end-7,8));
    calc_table(72,6) = cellOperations('mean', calc_table(3:end-7,15));
    calc_table(73,6) = cellOperations('mean', calc_table(3:end-7,22));
    
    calc_table(71,7) = cellOperations('mean', calc_table(3:end-7,9));
    calc_table(72,7) = cellOperations('mean', calc_table(3:end-7,16));
    calc_table(73,7) = cellOperations('mean', calc_table(3:end-7,23));
    
    calc_table(71,8) = cellOperations('mean', calc_table(3:end-7,10));
    calc_table(72,8) = cellOperations('mean', calc_table(3:end-7,17));
    calc_table(73,8) = cellOperations('mean', calc_table(3:end-7,24));
    
    calc_table(71,9) = cellOperations('sqrt', calc_table(71,8));
    calc_table(72,9) = cellOperations('sqrt', calc_table(72,8));
    calc_table(73,9) = cellOperations('sqrt', calc_table(73,8));
    
    calc_table(71,10) = cellOperations('corr', calc_table(3:end-7,5), calc_table(3:end-7,7));
    calc_table(72,10) = cellOperations('corr', calc_table(3:end-7,12), calc_table(3:end-7,14));
    calc_table(73,10) = cellOperations('corr', calc_table(3:end-7,19), calc_table(3:end-7,21));
    
    % ============================= additional_assessment_table_precipitation =========================
    
    calc_table_p(3:end-13,3) = night_assessment(4:end,6);
    calc_table_p(3:end-13,4) = night_assessment(4:end,7);
    calc_table_p(3:end-13,5) = prec_gulka(night_assessment(4:end,6), night_assessment(4:end,7)...
        , night_assessment(4:end,3), t_lim);
    
    calc_table_p(3:end-13,6) = day_assessment(4:end,6);
    calc_table_p(3:end-13,7) = day_assessment(4:end,7);
    calc_table_p(3:end-13,8) = prec_gulka(day_assessment(4:end,6), day_assessment(4:end,7)...
        , day_assessment(4:end,3), t_lim);
    
    % ======== night =============
    calc_table_p{71,11} = sum(strcmp(calc_table_p(3:67,5), 'совпадение'));
    calc_table_p{71,12} = sum(strcmp(calc_table_p(3:67,5), 'ложная тревога'));
    calc_table_p{72,11} = sum(strcmp(calc_table_p(3:67,5), 'пропуск'));
    calc_table_p{72,12} = 0;
    
    calc_table_p{73,11} = calc_table_p{71,11} + calc_table_p{72,11};
    calc_table_p{73,12} = calc_table_p{71,12} + calc_table_p{72,12};
    
    calc_table_p{71,13} = calc_table_p{71,11} + calc_table_p{71,12};
    calc_table_p{72,13} = calc_table_p{72,11} + calc_table_p{72,12};
    calc_table_p{73,13} = calc_table_p{71,13} + calc_table_p{72,13};
    
    
    % =========== day =============
    calc_table_p{77,11} = sum(strcmp(calc_table_p(3:67,8), 'совпадение'));
    calc_table_p{77,12} = sum(strcmp(calc_table_p(3:67,8), 'ложная тревога'));
    calc_table_p{78,11} = sum(strcmp(calc_table_p(3:67,8), 'пропуск'));
    calc_table_p{78,12} = 0;
    
    calc_table_p{79,11} = calc_table_p{77,11} + calc_table_p{78,11};
    calc_table_p{79,12} = calc_table_p{77,12} + calc_table_p{78,12};
    
    calc_table_p{77,13} = calc_table_p{77,11} + calc_table_p{77,12};
    calc_table_p{78,13} = calc_table_p{78,11} + calc_table_p{78,12};
    calc_table_p{79,13} = calc_table_p{77,13} + calc_table_p{78,13};
    
    
    % =========== table =============
    calc_table_p{77,3} = (calc_table_p{71,11} + calc_table_p{72,12}) / calc_table_p{73,13};
    calc_table_p{78,3} = (calc_table_p{77,11} + calc_table_p{78,12}) / calc_table_p{79,13};
    calc_table_p{79,3} = num2str(mean([calc_table_p{77,3}, calc_table_p{78,3}]), 3);
    calc_table_p{77,3} = num2str(calc_table_p{77,3}, 3);
    calc_table_p{78,3} = num2str(calc_table_p{78,3}, 3);
    
    calc_table_p{77,4} = (calc_table_p{71,11} + calc_table_p{71,12})...
        / (calc_table_p{71,11} + calc_table_p{72,11});
    calc_table_p{78,4} = (calc_table_p{77,11} + calc_table_p{77,12})...
        / (calc_table_p{77,11} + calc_table_p{78,11});
    calc_table_p{79,4} = num2str(mean([calc_table_p{77,4}, calc_table_p{78,4}]), 3);
    calc_table_p{77,4} = num2str(calc_table_p{77,4}, 3);
    calc_table_p{78,4} = num2str(calc_table_p{78,4}, 3);
    
    calc_table_p{77,5} = calc_table_p{71,11} / (calc_table_p{71,11} + calc_table_p{72,11});
    calc_table_p{78,5} = calc_table_p{77,11} / (calc_table_p{77,11} + calc_table_p{78,11});
    calc_table_p{79,5} = num2str(mean([calc_table_p{77,5}, calc_table_p{78,5}]), 3);
    calc_table_p{77,5} = num2str(calc_table_p{77,5}, 3);
    calc_table_p{78,5} = num2str(calc_table_p{78,5}, 3);
    
    calc_table_p{77,6} = calc_table_p{71,12} / (calc_table_p{71,11} + calc_table_p{71,12});
    calc_table_p{78,6} = calc_table_p{77,12} / (calc_table_p{77,11} + calc_table_p{77,12});
    calc_table_p{79,6} = num2str(mean([calc_table_p{77,6}, calc_table_p{78,6}]), 3);
    calc_table_p{77,6} = num2str(calc_table_p{77,6}, 3);
    calc_table_p{78,6} = num2str(calc_table_p{78,6}, 3);
    
    calc_table_p{77,7} = calc_table_p{71,11} / (calc_table_p{71,11} + calc_table_p{71,12});
    calc_table_p{78,7} = calc_table_p{77,11} / (calc_table_p{77,11} + calc_table_p{77,12});
    calc_table_p{79,7} = num2str(mean([calc_table_p{77,7}, calc_table_p{78,7}]), 3);
    calc_table_p{77,7} = num2str(calc_table_p{77,7}, 3);
    calc_table_p{78,7} = num2str(calc_table_p{78,7}, 3);
    
    calc_table_p{77,8} = calc_table_p{71,11}...
        / (calc_table_p{71,11} + calc_table_p{72,11} + calc_table_p{71,12});
    calc_table_p{78,8} = calc_table_p{77,11}...
        / (calc_table_p{77,11} + calc_table_p{78,11} + calc_table_p{77,12});
    calc_table_p{79,8} = num2str(mean([calc_table_p{77,8}, calc_table_p{78,8}]), 3);
    calc_table_p{77,8} = num2str(calc_table_p{77,8}, 3);
    calc_table_p{78,8} = num2str(calc_table_p{78,8}, 3);
    
    
    % ============================= additional_assessment_table_phenomenons =========================
    calc_table_phen(3:end-13,3:26) = night_assessment(4:end,9:32);
    calc_table_phen(3:end-13,28:51) = day_assessment(4:end,9:32);
    
    calc_table_phen(3:end-13,27) = phen_gulka(calc_table_phen(3:end-13,3:26));
    calc_table_phen(3:end-13,52) = phen_gulka(calc_table_phen(3:end-13,28:51));
    
    % ======== night =============
    calc_table_phen{71,13} = sum(strcmp(calc_table_phen(3:67,27), 'совпадение'));
    calc_table_phen{71,14} = sum(strcmp(calc_table_phen(3:67,27), 'ложная тревога'));
    calc_table_phen{72,13} = sum(strcmp(calc_table_phen(3:67,27), 'пропуск'));
    calc_table_phen{72,14} = sum(strcmp(calc_table_phen(3:67,27), 'отрицательный'));
    
    calc_table_phen{73,13} = calc_table_phen{71,13} + calc_table_phen{72,13};
    calc_table_phen{73,14} = calc_table_phen{71,14} + calc_table_phen{72,14};
    
    calc_table_phen{71,15} = calc_table_phen{71,13} + calc_table_phen{71,14};
    calc_table_phen{72,15} = calc_table_phen{72,13} + calc_table_phen{72,14};
    calc_table_phen{73,15} = calc_table_phen{71,15} + calc_table_phen{72,15};
    
    
    % =========== day =============
    calc_table_phen{77,13} = sum(strcmp(calc_table_phen(3:67,52), 'совпадение'));
    calc_table_phen{77,14} = sum(strcmp(calc_table_phen(3:67,52), 'ложная тревога'));
    calc_table_phen{78,13} = sum(strcmp(calc_table_phen(3:67,52), 'пропуск'));
    calc_table_phen{78,14} = sum(strcmp(calc_table_phen(3:67,52), 'отрицательный'));
    
    calc_table_phen{79,13} = calc_table_phen{77,13} + calc_table_phen{78,13};
    calc_table_phen{79,14} = calc_table_phen{77,14} + calc_table_phen{78,14};
    
    calc_table_phen{77,15} = calc_table_phen{77,13} + calc_table_phen{77,14};
    calc_table_phen{78,15} = calc_table_phen{78,13} + calc_table_phen{78,14};
    calc_table_phen{79,15} = calc_table_phen{77,15} + calc_table_phen{78,15};
    
    
    % =========== table =============
    calc_table_phen{77,3} = (calc_table_phen{71,13} + calc_table_phen{72,14}) / calc_table_phen{73,15};
    calc_table_phen{78,3} = (calc_table_phen{77,13} + calc_table_phen{78,14}) / calc_table_phen{79,15};
    calc_table_phen{79,3} = num2str(mean([calc_table_phen{77,3}, calc_table_phen{78,3}]), 3);
    calc_table_phen{77,3} = num2str(calc_table_phen{77,3}, 3);
    calc_table_phen{78,3} = num2str(calc_table_phen{78,3}, 3);
    
    calc_table_phen{77,4} = (calc_table_phen{71,13} + calc_table_phen{71,14})...
        / (calc_table_phen{71,13} + calc_table_phen{72,13});
    calc_table_phen{78,4} = (calc_table_phen{77,13} + calc_table_phen{77,14})...
        / (calc_table_phen{77,13} + calc_table_phen{78,13});
    calc_table_phen{79,4} = num2str(mean([calc_table_phen{77,4}, calc_table_phen{78,4}]), 3);
    calc_table_phen{77,4} = num2str(calc_table_phen{77,4}, 3);
    calc_table_phen{78,4} = num2str(calc_table_phen{78,4}, 3);
    
    calc_table_phen{77,5} = calc_table_phen{71,13} / (calc_table_phen{71,13} + calc_table_phen{72,13});
    calc_table_phen{78,5} = calc_table_phen{77,13} / (calc_table_phen{77,13} + calc_table_phen{78,13});
    calc_table_phen{79,5} = num2str(mean([calc_table_phen{77,5}, calc_table_phen{78,5}]), 3);
    calc_table_phen{77,5} = num2str(calc_table_phen{77,5}, 3);
    calc_table_phen{78,5} = num2str(calc_table_phen{78,5} , 3);
    
    calc_table_phen{77,6} = calc_table_phen{71,14} / (calc_table_phen{71,13} + calc_table_phen{71,14});
    calc_table_phen{78,6} = calc_table_phen{77,14} / (calc_table_phen{77,13} + calc_table_phen{77,14});
    calc_table_phen{79,6} = num2str(mean([calc_table_phen{77,6}, calc_table_phen{78,6}]), 3);
    calc_table_phen{77,6} = num2str(calc_table_phen{77,6}, 3);
    calc_table_phen{78,6} = num2str(calc_table_phen{78,6}, 3);
    
    calc_table_phen{77,7} = calc_table_phen{71,13} / (calc_table_phen{71,13} + calc_table_phen{71,14});
    calc_table_phen{78,7} = calc_table_phen{77,13} / (calc_table_phen{77,13} + calc_table_phen{77,14});
    calc_table_phen{79,7} = num2str(mean([calc_table_phen{77,7}, calc_table_phen{78,7}]), 3);
    calc_table_phen{77,7} = num2str(calc_table_phen{77,7}, 3);
    calc_table_phen{78,7} = num2str(calc_table_phen{78,7}, 3);
    
    calc_table_phen{77,8} = calc_table_phen{71,13}...
        / (calc_table_phen{71,13} + calc_table_phen{72,13} + calc_table_phen{71,14});
    calc_table_phen{78,8} = calc_table_phen{77,13}...
        / (calc_table_phen{77,13} + calc_table_phen{78,13} + calc_table_phen{77,14});
    calc_table_phen{79,8} = num2str(mean([calc_table_phen{77,8}, calc_table_phen{78,8}]), 3);
    calc_table_phen{77,8} = num2str(calc_table_phen{77,8}, 3);
    calc_table_phen{78,8} = num2str(calc_table_phen{78,8}, 3);
    
    calc_table_phen{77,9} = calc_table_phen{71,14} / (calc_table_phen{72,14} + calc_table_phen{71,14});
    calc_table_phen{78,9} = calc_table_phen{77,14} / (calc_table_phen{78,14} + calc_table_phen{77,14});
    calc_table_phen{79,9} = num2str(mean([calc_table_phen{77,9}, calc_table_phen{78,9}]), 3);
    calc_table_phen{77,9} = num2str(calc_table_phen{77,9}, 3);
    calc_table_phen{78,9} = num2str(calc_table_phen{78,9}, 3);
    
    calc_table_phen{77,10} = calc_table_phen{71,13} / (calc_table_phen{71,13} + calc_table_phen{72,13})...
        - calc_table_phen{71,14} / (calc_table_phen{71,14} + calc_table_phen{72,14});
    calc_table_phen{78,10} = calc_table_phen{77,13} / (calc_table_phen{77,13} + calc_table_phen{78,13})...
        - calc_table_phen{77,14} / (calc_table_phen{77,14} + calc_table_phen{78,14});
    calc_table_phen{79,10} = num2str(mean([calc_table_phen{77,10}, calc_table_phen{78,10}]), 3);
    calc_table_phen{77,10} = num2str(calc_table_phen{77,10}, 3);
    calc_table_phen{78,10} = num2str(calc_table_phen{78,10}, 3);   
end

