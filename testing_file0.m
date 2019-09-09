clc
clear
try
    %temperature_limit
    t_lim = -5;
    % =============================== night ===================================
    % =========================================================================
    [~,~,fact_t_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'C5:C67');
    [~,~,forecast_t_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'D5:D67');
    t_night = temperature(fact_t_n, forecast_t_n);
    
    [~,~,fact_p_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'F5:F67');
    [~,~,forecast_p_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'G5:G67');
    p_night = precipitation(fact_p_n, forecast_p_n, t_lim);
    
    %==================== phenomenons =========================================
    [~,~,forecast_wind_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'I5:I67');
    [~,~,fact_wind_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'U5:U67');
    wind_night = wind_func(fact_wind_n, forecast_wind_n);
    
    [~,~,phen_fore_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'J5:T67');
    [~,~,phen_fact_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'V5:AF67');
    % assessment = phen_assessment(wind_night, 0, phen_fore, phen_fact);
    
    % =============================== day =====================================
    % =========================================================================
    
    [~,~,fact_t_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AJ5:AJ67');
    [~,~,forecast_t_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AK5:AK67');
    t_day = temperature(fact_t_d, forecast_t_d);
    
    [~,~,fact_p_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AM5:AM67');
    [~,~,forecast_p_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AN5:AN67');
    p_day = precipitation(fact_p_d, forecast_p_d, t_lim);
    
    %==================== phenomenons =========================================
    [~,~,fact_wind_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AP5:AP67');
    [~,~,forecast_wind_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'BB5:BB67');
    wind_day = wind_func(fact_wind_d, forecast_wind_d);
    
    
    % ============== night_output =============================================
    % =========================================================================
    
    xlswrite([pwd, '/output_table.xlsx'], fact_t_n, 1, 'C5:C67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_t_n, 1, 'D5:D67');
    xlswrite([pwd, '/output_table.xlsx'], t_night, 1, 'E5:E67');
    
    xlswrite([pwd, '/output_table.xlsx'], fact_p_n, 1, 'F5:F67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_p_n, 1, 'G5:G67');
    xlswrite([pwd, '/output_table.xlsx'], p_night, 1, 'H5:H67');
    
    % =============== phenomenon assessment night ==============
    xlswrite([pwd, '/output_table.xlsx'], fact_wind_n, 1, 'I5:I67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_wind_n, 1, 'U5:U67');
    %xlswrite([pwd, '/output_table.xlsx'], forecast_phen_n, 1, 'T5:T67');
    
    % ============= day_output ================================================
    % =========================================================================
    
    xlswrite([pwd, '/output_table.xlsx'], fact_t_d, 2, 'C5:C67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_t_d, 2, 'D5:D67');
    xlswrite([pwd, '/output_table.xlsx'], t_day, 2, 'E5:E67');
    
    xlswrite([pwd, '/output_table.xlsx'], fact_p_d, 2, 'F5:F67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_p_d, 2, 'G5:G67');
    xlswrite([pwd, '/output_table.xlsx'], p_day, 2, 'H5:H67');
    
    % =============== phenomenon assessment day ==============
    xlswrite([pwd, '/output_table.xlsx'], fact_wind_d, 2, 'I5:I67');
    xlswrite([pwd, '/output_table.xlsx'], forecast_wind_d, 2, 'U5:U67');
    %xlswrite([pwd, '/output_table.xlsx'], forecast_phen_n, 1, 'T5:T67');
catch
    warning('Problem reading xlsx file');
end
