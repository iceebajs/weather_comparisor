clc
clear
%temperature_limit
t_lim = -5;
% =============================== night ===================================
[~,~,fact_t_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'F5:F67');
[~,~,forecast_t_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'G5:G67');

fact_t_n = trash_cleaner(fact_t_n);
forecast_t_n = trash_cleaner(forecast_t_n);
t_night = temperature(fact_t_n, forecast_t_n);


[~,~,fact_p_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'I5:I67');
[~,~,forecast_p_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'J5:J67');

fact_p_n = trash_cleaner(fact_p_n);
forecast_p_n = trash_cleaner(forecast_p_n);
p_night = precipitation(fact_p_n,forecast_p_n, t_lim);

%==================== phenomenons =========================================

[~,~,fact_wind_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'AI5:AI67');
[~,~,forecast_wind_n] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'M5:M67');

fact_wind_n = trash_cleaner(fact_wind_n);
forecast_wind_n = trash_cleaner(forecast_wind_n);


% =============================== day =====================================
[~,~,fact_t_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'BA5:BA67');
[~,~,forecast_t_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'BB5:BB67');

fact_t_d = trash_cleaner(fact_t_d);
forecast_t_d = trash_cleaner(forecast_t_d);
t_day = temperature(fact_t_d, forecast_t_d);


[~,~,fact_p_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'BD5:BD67');
[~,~,forecast_p_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'BE5:BE67');

fact_p_d = trash_cleaner(fact_p_d);
forecast_p_d = trash_cleaner(forecast_p_d);
p_day = precipitation(fact_p_d,forecast_p_d, t_lim);

%==================== phenomenons =========================================

[~,~,fact_wind_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'CF5:CF67');
[~,~,forecast_wind_d] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'BH5:BH67');

fact_wind_d = trash_cleaner(fact_wind_d);
forecast_wind_d = trash_cleaner(forecast_wind_d);



%============== night_output =================================
xlswrite([pwd, '/output_table.xlsx'], fact_t_n, 1, 'C4:C55');
xlswrite([pwd, '/output_table.xlsx'], forecast_t_n, 1, 'D4:D55');
xlswrite([pwd, '/output_table.xlsx'], t_night, 1, 'E4:E55');

xlswrite([pwd, '/output_table.xlsx'], fact_p_n, 1, 'F4:F55');
xlswrite([pwd, '/output_table.xlsx'], forecast_p_n, 1, 'G4:G55');
xlswrite([pwd, '/output_table.xlsx'], p_night, 1, 'H4:H55');

%{
xlswrite([pwd, '/output_table.xlsx'], fact_phen_n, 1, 'I4:I55');
xlswrite([pwd, '/output_table.xlsx'], forecast_phen_n, 1, 'J4:J55');
xlswrite([pwd, '/output_table.xlsx'], phen_n, 1, 'K4:K55');
%}
%============= day_output ================================
xlswrite([pwd, '/output_table.xlsx'], fact_t_d, 2, 'C4:C55');
xlswrite([pwd, '/output_table.xlsx'], forecast_t_d, 2, 'D4:D55');
xlswrite([pwd, '/output_table.xlsx'], t_day, 2, 'E4:E55');

xlswrite([pwd, '/output_table.xlsx'], fact_p_d, 2, 'F4:F55');
xlswrite([pwd, '/output_table.xlsx'], forecast_p_d, 2, 'G4:G55');
xlswrite([pwd, '/output_table.xlsx'], p_day, 2, 'H4:H55');
%{
xlswrite([pwd, '/output_table.xlsx'], fact_phen_d, 2, 'I4:I55');
xlswrite([pwd, '/output_table.xlsx'], forecast_phen_d, 2, 'J4:J55');
xlswrite([pwd, '/output_table.xlsx'], phen_d, 2, 'K4:K55');
%}