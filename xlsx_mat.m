clc
clear

% [~,night_table,~] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'A2:AF67');
% [~,day_table,~] = xlsread([pwd, '/new_data_sample.xlsx'], 1,'AH2:BM67');
% night_table(3,:) = [];
% day_table(3,:) = [];
% night_table(:,8) = [];
% night_table(:,5) = [];
% day_table(:,8) = [];
% day_table(:,5) = [];
% save('day.mat', 'day_table');
% save('night.mat', 'night_table');
[~,night_assessment,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 1,'A2:AH67');
[~,day_assessment,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 2,'A2:AH67');
save('night_assessment.mat', 'night_assessment');
save('day_assessment.mat', 'day_assessment');