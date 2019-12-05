function [calc_table_fullassess, date] = monthData_func(list)
load('calc_table_fullassess.mat');

out = cell(1,20);
dataStorage = cell(1,20);

listCleaner = zeros(length(list),1);
for n = 1:length(list)
    if list(n).('bytes') == 0
        listCleaner(n) = 1;
    end
end

list(logical(listCleaner)) = [];
dateSample = readtable([list(1).('folder'), '\', list(1).('name')], 'Sheet', 1);

date = dateSample.Properties.VariableDescriptions(1);
expression = '(?<day>\d+).(?<month>\d+).(?<year>\d+)';
date = regexp(date{1},expression,'names');
fileDate_pub = [str2double(date(1).('month')), str2double(date(1).('year'))];

if fileDate_pub(1) < 10
    temp_string = ['0', num2str(fileDate_pub(1)), '.'];
    temp_string = strcat(temp_string, num2str(fileDate_pub(2)));
else
    temp_string = strcat(num2str(fileDate_pub(1), '.'));
    temp_string = strcat(temp_string, num2str(fileDate_pub(2)));
end


date = temp_string;
clear temp_string dateSample;

                
for n = 1:length(list)
        % ========= fullday ===============
        fullday = table2cell(readtable([list(n).('folder'), '\', list(n).('name')], 'Sheet', 3));
        fullday = fullday(2:end, 5);
        temp = 0;
        iterations = 0;
        for k = 1:length(fullday)
            temp0 = str2double(fullday{k});            
            if ~isnan(temp0)
                temp = temp + temp0;
                iterations = iterations + 1;
            end            
        end
        dataStorage{n,1} = temp/(iterations*100);
        clear temp temp0 iterations;

        %2-6
        % ========= temperature ============
        temperature = table2cell(readtable([list(n).('folder'), '\', list(n).('name')], 'Sheet', 5));
        temperature = temperature(72, 5:10);
        temperature(5) = [];
        for k = 1:length(temperature)
            dataStorage{n,k+1} = str2double(temperature{k});
        end
        
        %7-12
        % ========= precipitation ==========
        prec = table2cell(readtable([list(n).('folder'), '\', list(n).('name')], 'Sheet', 6));
        prec = prec(78, 3:8);
        for k = 1:length(prec)
            dataStorage{n,k+6} = str2double(prec{k});
        end
        
        %13-20
        % ========= phenomenons ============
        phen = table2cell(readtable([list(n).('folder'), '\', list(n).('name')], 'Sheet', 7));
        phen = phen(78, 3:10);
        for k = 1:length(phen)
            dataStorage{n,k+12} = str2double(phen{k});
        end
end

for n = 1:length(out)
    temp = 0;
    for k = 1:length(dataStorage(:,1))
        temp = temp + dataStorage{k,n};        
    end
    out{n} = num2str(temp/length(dataStorage(:,1)) , 3);
end

calc_table_fullassess(3,2:end) = out;

end

