clc
clear

t_lim = -5;

% =============================== night ===================================
% =========================================================================
load night.mat
load day.mat
fact_t_n = night_table(3:end, 3);
forecast_t_n = night_table(3:end, 4);
t_night = temperature(fact_t_n, forecast_t_n);

fact_p_n = night_table(3:end, 5);
forecast_p_n = night_table(3:end, 6);
p_night = precipitation(fact_p_n, forecast_p_n, fact_t_n, t_lim);

%==================== phenomenons =========================================
forecast_wind_n = night_table(3:end, 7);
fact_wind_n = night_table(3:end, 19);
wind_night = wind_func(fact_wind_n, forecast_wind_n);

phen_fore_n = night_table(3:end, 8:18);
phen_fact_n = night_table(3:end, 20:30);
assessment_night = phen_assessment(wind_night, phen_fore_n, phen_fact_n);

% =============================== day =====================================
% =========================================================================

fact_t_d = day_table(3:end, 3);
forecast_t_d = day_table(3:end, 4);
t_day = temperature(fact_t_d, forecast_t_d);

fact_p_d = day_table(3:end, 5);
forecast_p_d = day_table(3:end, 6);
p_day = precipitation(fact_p_d, forecast_p_d, fact_t_d, t_lim);

%==================== phenomenons =========================================
forecast_wind_d = day_table(3:end, 7);
fact_wind_d = day_table(3:end, 19);
wind_day = wind_func(fact_wind_d, forecast_wind_d);

phen_fore_d = day_table(3:end, 8:18);
phen_fact_d = day_table(3:end, 20:30);
assessment_day = phen_assessment(wind_day, phen_fore_d, phen_fact_d);


% ============== night_output =============================================
% =========================================================================
load night_assessment
load day_assessment

night_assessment(4:end,3) = fact_t_n;
night_assessment(4:end,4) = forecast_t_n;
night_assessment(4:end,5) = t_night;

night_assessment(4:end,6) = fact_p_n;
night_assessment(4:end,7) = forecast_p_n;
night_assessment(4:end,8) = p_night;


% =============== phenomenon assessment night ==============
night_assessment(4:end,9) = fact_wind_n;
night_assessment(4:end,21) = forecast_wind_n;
night_assessment(4:end,10:20) = phen_fact_n;
night_assessment(4:end,22:32) = phen_fore_n;
night_assessment(4:end,33) = num2cell(assessment_night);

% ============= day_output ================================================
% =========================================================================
day_assessment(4:end,3) = fact_t_d;
day_assessment(4:end,4) = forecast_t_d;
day_assessment(4:end,5) = t_day;

day_assessment(4:end,6) = fact_p_d;
day_assessment(4:end,7) = forecast_p_d;
day_assessment(4:end,8) = p_day;


% =============== phenomenon assessment night ==============
day_assessment(4:end,9) = fact_wind_d;
day_assessment(4:end,21) = forecast_wind_d;
day_assessment(4:end,10:20) = phen_fact_d;
day_assessment(4:end,22:32) = phen_fore_d;
day_assessment(4:end,33) = num2cell(assessment_day);