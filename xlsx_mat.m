clc
clear

% [~,night_table,~] = xlsread([pwd, '/bin/�������.xlsx'], 1,'A2:AF67');
% [~,day_table,~] = xlsread([pwd, '/bin/�������.xlsx'], 1,'AH2:BM67');
% night_table(3,:) = [];
% day_table(3,:) = [];
% night_table(:,8) = [];
% night_table(:,5) = [];
% day_table(:,8) = [];
% day_table(:,5) = [];
% day_table{2,15} = '�����.�����';
% night_table{2,15} = '�����.�����';
% day_table{2,27} = '�����.�����';
% night_table{2,27} = '�����.�����';
% save('day.mat', 'day_table');
% save('night.mat', 'night_table');

% [~,night_assessment,~] = xlsread([pwd, '/bin/������_���������������.xlsx'], 1,'A2:AH67');
% [~,day_assessment,~] = xlsread([pwd, '/bin/������_���������������.xlsx'], 2,'A2:AH67');
% save('night_assessment.mat', 'night_assessment');
% save('day_assessment.mat', 'day_assessment');
% 
% [~,assessment_fullday,~] = xlsread([pwd, '/bin/������_���������������.xlsx'], 3,'A2:E68');
% assessment_fullday{2,5} = assessment_fullday{1,5};
% assessment_fullday(1,:) = [];
% assessment_fullday(3,:) = [];
% save('assessment_fullday.mat', 'assessment_fullday');
% 
% [~,territorial_assessment,~] = xlsread([pwd, '/bin/������_���������������.xlsx'], 4,'A1:M12');
% territorial_assessment(9,:) = [];
% territorial_assessment(7,:) = [];
% territorial_assessment(6,:) = [];
% territorial_assessment(5,:) = [];
% territorial_assessment(2,:) = [];
% save('territorial_assessment.mat', 'territorial_assessment');

% data = readtable([pwd, '/bin/�������.xlsx']);
% data(3,:) = [];
% night_table = table2cell(data(1:end,1:32));
% night_table(:,8) = [];
% night_table(:,5) = [];
% day_table = table2cell(data(1:end,35:66));
% day_table(:,8) = [];
% day_table(:,5) = [];
% save('day.mat', 'day_table');
% save('night.mat', 'night_table');

% night_assessment = table2cell(readtable([pwd, '/bin/������_���������������.xlsx'],'Sheet',1));
% day_assessment = table2cell(readtable([pwd, '/bin/������_���������������.xlsx'],'Sheet',2));
% assessment_fullday = table2cell(readtable([pwd, '/bin/������_���������������.xlsx'],'Sheet',3));
% assessment_fullday(3,:) = [];
% assessment_fullday(1,5) = {'��������������� �������� �� �����'};
% save('assessment_fullday.mat', 'assessment_fullday');
% save('day_assessment.mat', 'day_assessment');
% save('night_assessment.mat', 'night_assessment');

% ====================================================
% 
% temp = table2cell(readtable('���_������_�����������.xlsx'));
% temp(2,:) = [];
% temp{1,3} = '�����';
% temp(70,:) = [];
% 
% calc_table = cell(length(temp(:,1))+1,length(temp(1,:)));
% calc_table{1,4} = '����������� ����';
% calc_table{1,11} = '����������� ����';
% calc_table{1,18} = '����������� �����';
% 
% for n = 2:length(temp(:,1))+1
%     calc_table(n,:) = temp(n-1,:);
% end
% 
% save('calc_table.mat', 'calc_table');


% normData = table2cell(readtable('�����_1981-2010.xlsx'));
% normData(3,:) = [];
% normData(2,:) = [];
% normData(1,:) = [];
% normData(:,16) = [];
% save('normData.mat', 'normData');
% 
% temp = table2cell(readtable('���_������_������.xlsx'));
% temp(2,:) = [];
% calc_table_p = cell(length(temp(:,1))+1, length(temp(1,:)));
% 
% for n = 1:length(calc_table_p(1,:))
%     calc_table_p(2:end,n) = temp(1:end,n);
% end
% 
% for n = 1:length(calc_table_p)
%     calc_table_p{n,9} = [];
% end
% 
% calc_table_p{1,3} = '������ ����';
% calc_table_p{1,6} = '������ ����';
% calc_table_p{2,1} = '�������';
% calc_table_p{2,2} = '�������';
% 
% save('calc_table_p.mat', 'calc_table_p');

temp = table2cell(readtable('���_������_�������.xlsx'));
temp(2,:) = [];
temp(:, 28) = [];
calc_table_phen = cell(length(temp(:,1))+1, length(temp(1,:)));

for n = 1:length(calc_table_phen(1,:))
    calc_table_phen(2:end,n) = temp(1:end,n);
end



calc_table_phen{1,3} = '������� ����������� ����';
calc_table_phen{1,28} = '������� ����������� ����';
calc_table_phen{2,1} = '�������';
calc_table_phen{2,2} = '�������';

calc_table_phen{14,2} = '';
calc_table_phen{15,2} = '';
calc_table_phen{23,2} = '';
calc_table_phen{24,2} = '';
calc_table_phen{37,2} = '';
calc_table_phen{38,2} = '';
calc_table_phen{46,2} = '';
calc_table_phen{47,2} = '';
calc_table_phen{57,2} = '';
calc_table_phen{58,2} = '';
calc_table_phen{66,2} = '';
calc_table_phen{67,2} = '';

save('calc_table_phen.mat', 'calc_table_phen');