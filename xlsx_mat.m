clc
clear

% [~,night_table,~] = xlsread([pwd, '/bin/образец.xlsx'], 1,'A2:AF67');
% [~,day_table,~] = xlsread([pwd, '/bin/образец.xlsx'], 1,'AH2:BM67');
% night_table(3,:) = [];
% day_table(3,:) = [];
% night_table(:,8) = [];
% night_table(:,5) = [];
% day_table(:,8) = [];
% day_table(:,5) = [];
% day_table{2,15} = 'налип.снега';
% night_table{2,15} = 'налип.снега';
% day_table{2,27} = 'налип.снега';
% night_table{2,27} = 'налип.снега';
% save('day.mat', 'day_table');
% save('night.mat', 'night_table');

% [~,night_assessment,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 1,'A2:AH67');
% [~,day_assessment,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 2,'A2:AH67');
% save('night_assessment.mat', 'night_assessment');
% save('day_assessment.mat', 'day_assessment');
% 
% [~,assessment_fullday,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 3,'A2:E68');
% assessment_fullday{2,5} = assessment_fullday{1,5};
% assessment_fullday(1,:) = [];
% assessment_fullday(3,:) = [];
% save('assessment_fullday.mat', 'assessment_fullday');
% 
% [~,territorial_assessment,~] = xlsread([pwd, '/bin/оценка_прогнозирования.xlsx'], 4,'A1:M12');
% territorial_assessment(9,:) = [];
% territorial_assessment(7,:) = [];
% territorial_assessment(6,:) = [];
% territorial_assessment(5,:) = [];
% territorial_assessment(2,:) = [];
% save('territorial_assessment.mat', 'territorial_assessment');

data = readtable([pwd, '/bin/образец.xlsx']);
data(3,:) = [];
night_table = table2cell(data(1:end,1:32));
night_table(:,8) = [];
night_table(:,5) = [];
day_table = table2cell(data(1:end,35:66));
day_table(:,8) = [];
day_table(:,5) = [];
save('day.mat', 'day_table');
save('night.mat', 'night_table');

% night_assessment = table2cell(readtable([pwd, '/bin/оценка_прогнозирования.xlsx'],'Sheet',1));
% day_assessment = table2cell(readtable([pwd, '/bin/оценка_прогнозирования.xlsx'],'Sheet',2));
% assessment_fullday = table2cell(readtable([pwd, '/bin/оценка_прогнозирования.xlsx'],'Sheet',3));
% assessment_fullday(3,:) = [];
% assessment_fullday(1,5) = {'Оправдываемость прогноза на сутки'};
% save('assessment_fullday.mat', 'assessment_fullday');
% save('day_assessment.mat', 'day_assessment');
% save('night_assessment.mat', 'night_assessment');