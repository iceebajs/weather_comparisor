clc
clear
%temperature_limit
t_lim = -5;
% =============================== night ===================================
[~,~,fact_t_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'C5:C67');
[~,~,forecast_t_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'D5:D67');
t_night = temperature(fact_t_n, forecast_t_n);

[~,~,fact_p_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'F5:F67');
[~,~,forecast_p_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'G5:G67');
p_night = precipitation(fact_p_n,forecast_p_n, t_lim);

%==================== phenomenons =========================================
[~,~,forecast_wind_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'I5:I67');
[~,~,fact_wind_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'T5:T67');
wind_night = wind_func(fact_wind_n, forecast_wind_n);

[~,~,forecast_hardprec_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'R5:R67');
[~,~,fact_hardprec_n] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AD5:AD67');


% =============================== day =====================================
[~,~,fact_t_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AI5:AI67');
[~,~,forecast_t_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AJ5:AJ67');
t_day = temperature(fact_t_d, forecast_t_d);

[~,~,fact_p_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AL5:AL67');
[~,~,forecast_p_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AM5:AM67');
p_day = precipitation(fact_p_d,forecast_p_d, t_lim);

%==================== phenomenons =========================================
[~,~,fact_wind_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AO5:AO67');
[~,~,forecast_wind_d] = xlsread([pwd, '/new_data_sample_test.xlsx'], 1,'AZ5:AZ67');



%============== night_output =================================
xlswrite([pwd, '/output_table.xlsx'], fact_t_n, 1, 'C5:C66');
xlswrite([pwd, '/output_table.xlsx'], forecast_t_n, 1, 'D5:D66');
xlswrite([pwd, '/output_table.xlsx'], t_night, 1, 'E5:E66');

xlswrite([pwd, '/output_table.xlsx'], fact_p_n, 1, 'F5:F66');
xlswrite([pwd, '/output_table.xlsx'], forecast_p_n, 1, 'G5:G66');
xlswrite([pwd, '/output_table.xlsx'], p_night, 1, 'H5:H66');

%{
xlswrite([pwd, '/output_table.xlsx'], fact_phen_n, 1, 'I4:I55');
xlswrite([pwd, '/output_table.xlsx'], forecast_phen_n, 1, 'J4:J55');
xlswrite([pwd, '/output_table.xlsx'], phen_n, 1, 'K4:K55');
%}
%============= day_output ================================
xlswrite([pwd, '/output_table.xlsx'], fact_t_d, 2, 'C5:C66');
xlswrite([pwd, '/output_table.xlsx'], forecast_t_d, 2, 'D5:D66');
xlswrite([pwd, '/output_table.xlsx'], t_day, 2, 'E5:E66');

xlswrite([pwd, '/output_table.xlsx'], fact_p_d, 2, 'F5:F66');
xlswrite([pwd, '/output_table.xlsx'], forecast_p_d, 2, 'G5:G66');
xlswrite([pwd, '/output_table.xlsx'], p_day, 2, 'H5:H66');
%{
xlswrite([pwd, '/output_table.xlsx'], fact_phen_d, 2, 'I4:I55');
xlswrite([pwd, '/output_table.xlsx'], forecast_phen_d, 2, 'J4:J55');
xlswrite([pwd, '/output_table.xlsx'], phen_d, 2, 'K4:K55');
%}