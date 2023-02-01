% Main Script

clear
clc

patients = readcell('InputData.xlsx'); 


% There are 97 patiens and they are listed from Row 2 to 98.

%Column 1 = ID
%Column 2 = Name
%Column 3 = Surname
%Column 4 = Day
%Column 5 = Duration
%Column 6 = Available Start
%Column 7 = AvailableFinish
%Column 8 = Priority

patients_array = cell(1,97); % 97 Patients are listed as their IDs (1 to 97).

for index = 2 : 98
    patients_array{1,index - 1} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
end

day1_patients = cell(1,20);
day1_intervals = cell(1,20);
day1_operations_first_priority = {};
day1_operations_second_priority = {};
day1_operations_third_priority = {};
day1_operations_fourth_priority = {};

day2_patients = cell(1,20);
day2_intervals = cell(1,20);
day2_operations_first_priority = {};
day2_operations_second_priority = {};
day2_operations_third_priority = {};
day2_operations_fourth_priority = {};

day3_patients = cell(1,19);
day3_intervals = cell(1,19);
day3_operations_first_priority = {};
day3_operations_second_priority = {};
day3_operations_third_priority = {};
day3_operations_fourth_priority = {};

day4_patients = cell(1,19);
day4_intervals = cell(1,19);
day4_operations_first_priority = {};
day4_operations_second_priority = {};
day4_operations_third_priority = {};
day4_operations_fourth_priority = {};

day5_patients = cell(1,19);
day5_intervals = cell(1,19);
day5_operations_first_priority = {};
day5_operations_second_priority = {};
day5_operations_third_priority = {};
day5_operations_fourth_priority = {};


for index = 2 : 21

    day1_patients{1, index-1} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
    day1_intervals{1, index-1} = Interval(patients{index,6},patients{index,7});

    if day1_patients{1, index-1}.priority == 1
        day1_operations_first_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-1},patients{index,5},patients{index,4});
    
    elseif day1_patients{1, index-1}.priority == 2
        day1_operations_second_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-1},patients{index,5},patients{index,4});
    
    elseif day1_patients{1, index-1}.priority == 3
        day1_operations_third_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-1},patients{index,5},patients{index,4});
    
    elseif day1_patients{1, index-1}.priority == 4
        day1_operations_fourth_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-1},patients{index,5},patients{index,4});
    end

end

for index = 22 : 41
    day2_patients{1, index-21} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
    day2_intervals{1, index-21} = Interval(patients{index,6},patients{index,7});

    if day2_patients{1, index-21}.priority == 1
        day2_operations_first_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-21},patients{index,5},patients{index,4});
    
    elseif day2_patients{1, index-21}.priority == 2
        day2_operations_second_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-21},patients{index,5},patients{index,4});
    
    elseif day2_patients{1, index-21}.priority == 3
        day2_operations_third_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-21},patients{index,5},patients{index,4});
    
    elseif day2_patients{1, index-21}.priority == 4
        day2_operations_fourth_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-21},patients{index,5},patients{index,4});
    end

end

for index = 42 : 60
    day3_patients{1, index-41} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
    day3_intervals{1, index-41} = Interval(patients{index,6},patients{index,7});
    

    %[day1_intervals{1, index-41}.left, day1_intervals{1, index-41}.right]
    if day3_patients{1, index-41}.priority == 1
        day3_operations_first_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-41},patients{index,5},patients{index,4});
    
    elseif day3_patients{1, index-41}.priority == 2
        day3_operations_second_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-41},patients{index,5},patients{index,4});
    
    elseif day3_patients{1, index-41}.priority == 3
        day3_operations_third_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-41},patients{index,5},patients{index,4});
    
    elseif day3_patients{1, index-41}.priority == 4
        day3_operations_fourth_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-41},patients{index,5},patients{index,4});
    end

end

for index = 61 : 79
    day4_patients{1, index-60} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
    day4_intervals{1, index-60} = Interval(patients{index,6},patients{index,7});
    
    if day4_patients{1, index-60}.priority == 1
        day4_operations_first_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-60},patients{index,5},patients{index,4});
    
    elseif day4_patients{1, index-60}.priority == 2
        day4_operations_second_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-60},patients{index,5},patients{index,4});
    
    elseif day4_patients{1, index-60}.priority == 3
        day4_operations_third_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-60},patients{index,5},patients{index,4});
    
    elseif day4_patients{1, index-60}.priority == 4
        day4_operations_fourth_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-60},patients{index,5},patients{index,4});
    end

end

for index = 80 : 98
    day5_patients{1, index-79} = Patient(patients{index,1},patients{index,2},patients{index,3},patients{index,8},patients{index,4});
    day5_intervals{1, index-79} = Interval(patients{index,6},patients{index,7});
    
    if day5_patients{1, index-79}.priority == 1
        day5_operations_first_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-79},patients{index,5},patients{index,4});
    
    elseif day5_patients{1, index-79}.priority == 2
        day5_operations_second_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-79},patients{index,5},patients{index,4});
    
    elseif day5_patients{1, index-79}.priority == 3
        day5_operations_third_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-79},patients{index,5},patients{index,4});
    
    elseif day5_patients{1, index-79}.priority == 4
        day5_operations_fourth_priority{end+1} = Operation(patients{index,1}, patients_array{1,index-1}, day1_intervals{1, index-79},patients{index,5},patients{index,4});
    end

end

array_of_durations_day1_first = array_of_durations_calculator(day1_operations_first_priority);
array_of_durations_day1_second = array_of_durations_calculator(day1_operations_second_priority);
array_of_durations_day1_third  = array_of_durations_calculator(day1_operations_third_priority);
array_of_durations_day1_fourth  = array_of_durations_calculator(day1_operations_fourth_priority);

array_of_durations_day2_first = array_of_durations_calculator(day2_operations_first_priority);
array_of_durations_day2_second = array_of_durations_calculator(day2_operations_second_priority);
array_of_durations_day2_third  = array_of_durations_calculator(day2_operations_third_priority);
array_of_durations_day2_fourth  = array_of_durations_calculator(day2_operations_fourth_priority);

array_of_durations_day3_first = array_of_durations_calculator(day3_operations_first_priority);
array_of_durations_day3_second = array_of_durations_calculator(day3_operations_second_priority);
array_of_durations_day3_third  = array_of_durations_calculator(day3_operations_third_priority);
array_of_durations_day3_fourth  = array_of_durations_calculator(day3_operations_fourth_priority);

array_of_durations_day4_first = array_of_durations_calculator(day4_operations_first_priority);
array_of_durations_day4_second = array_of_durations_calculator(day4_operations_second_priority);
array_of_durations_day4_third  = array_of_durations_calculator(day4_operations_third_priority);
array_of_durations_day4_fourth  = array_of_durations_calculator(day4_operations_fourth_priority);

array_of_durations_day5_first = array_of_durations_calculator(day5_operations_first_priority);
array_of_durations_day5_second = array_of_durations_calculator(day5_operations_second_priority);
array_of_durations_day5_third  = array_of_durations_calculator(day5_operations_third_priority);
array_of_durations_day5_fourth  = array_of_durations_calculator(day5_operations_fourth_priority);
%up to now, we took first_priority_operations_day1, sorted their durations in ascending
%order and determined which one corresponds to which index. stored in
%array_of_durations

postponed_operations_to_day2 = {};
postponed_operations_to_day3 = {};
postponed_operations_to_day4 = {};
postponed_operations_to_day5 = {};
postponed_operations_to_day6 = {};
[scheduled_first_room_day1,array_result_for_control,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2] = scheduler(array_of_durations_day1_first,day1_operations_first_priority,postponed_operations_to_day2);
first_priority_day_1 = array_result_for_control;

[scheduled_first_room_day1,array_result_for_control,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2] = scheduler_after_first(array_of_durations_day1_second,day1_operations_second_priority,scheduled_first_room_day1,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2);
second_priority_day_1 = array_result_for_control;

[scheduled_first_room_day1,array_result_for_control,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2] = scheduler_after_first(array_of_durations_day1_third,day1_operations_third_priority,scheduled_first_room_day1,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2);
third_priority_day_1 = array_result_for_control;

[scheduled_first_room_day1,array_result_for_control,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2] = scheduler_after_first(array_of_durations_day1_fourth,day1_operations_fourth_priority,scheduled_first_room_day1,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,postponed_operations_to_day2);
fourth_priority_day_1 = array_result_for_control;




array_of_durations_day2_zero = array_of_durations_calculator(postponed_operations_to_day2);

if length(array_of_durations_day2_zero) ~= 0

    [scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler(array_of_durations_day2_zero,postponed_operations_to_day2,postponed_operations_to_day3);
    zero_priority_day_2 = array_result_for_control;
    [scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler_after_first(array_of_durations_day2_first,day2_operations_first_priority,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3);
    first_priority_day_2 = array_result_for_control;
else

    [scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler(array_of_durations_day2_first,day2_operations_first_priority,postponed_operations_to_day3);
    first_priority_day_2 = array_result_for_control;
end


[scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler_after_first(array_of_durations_day2_second,day2_operations_second_priority,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3);
second_priority_day_2 = array_result_for_control;

[scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler_after_first(array_of_durations_day2_third,day2_operations_third_priority,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3);
third_priority_day_2 = array_result_for_control;

[scheduled_first_room_day2,array_result_for_control,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3] = scheduler_after_first(array_of_durations_day2_fourth,day2_operations_fourth_priority,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,postponed_operations_to_day3);
fourth_priority_day_2 = array_result_for_control;



array_of_durations_day3_zero = array_of_durations_calculator(postponed_operations_to_day3);

if length(array_of_durations_day3_zero) ~= 0

    [scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler(array_of_durations_day3_zero,postponed_operations_to_day3,postponed_operations_to_day4);
    zero_priority_day_3 = array_result_for_control;
    [scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler_after_first(array_of_durations_day3_first,day3_operations_first_priority,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4);
    first_priority_day_3 = array_result_for_control;
else

    [scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler(array_of_durations_day3_first,day3_operations_first_priority,postponed_operations_to_day4);
    first_priority_day_3 = array_result_for_control;
end

[scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler_after_first(array_of_durations_day3_second,day3_operations_second_priority,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4);
second_priority_day_3 = array_result_for_control;

[scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler_after_first(array_of_durations_day3_third,day3_operations_third_priority,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4);
third_priority_day_3 = array_result_for_control;

[scheduled_first_room_day3,array_result_for_control,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4] = scheduler_after_first(array_of_durations_day3_fourth,day3_operations_fourth_priority,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,postponed_operations_to_day4);
fourth_priority_day_3 = array_result_for_control;


array_of_durations_day4_zero = array_of_durations_calculator(postponed_operations_to_day4);

if length(array_of_durations_day4_zero) ~= 0

    [scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler(array_of_durations_day4_zero,postponed_operations_to_day4,postponed_operations_to_day5);
    zero_priority_day_4 = array_result_for_control;
    [scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler_after_first(array_of_durations_day4_first,day4_operations_first_priority,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5);
    first_priority_day_4 = array_result_for_control;
else

    [scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler(array_of_durations_day4_first,day4_operations_first_priority,postponed_operations_to_day5);
    first_priority_day_4 = array_result_for_control;
end

[scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler_after_first(array_of_durations_day4_second,day4_operations_second_priority,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5);
second_priority_day_4 = array_result_for_control;

[scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler_after_first(array_of_durations_day4_third,day4_operations_third_priority,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5);
third_priority_day_4 = array_result_for_control;

[scheduled_first_room_day4,array_result_for_control,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5] = scheduler_after_first(array_of_durations_day4_fourth,day4_operations_fourth_priority,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,postponed_operations_to_day5);
fourth_priority_day_4 = array_result_for_control;


array_of_durations_day5_zero = array_of_durations_calculator(postponed_operations_to_day5);

if length(array_of_durations_day5_zero) ~= 0

    [scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler(array_of_durations_day5_zero,postponed_operations_to_day5,postponed_operations_to_day6);
    zero_priority_day_5 = array_result_for_control;
    [scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler_after_first(array_of_durations_day5_first,day5_operations_first_priority,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6);
    first_priority_day_5 = array_result_for_control;
else

    [scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler(array_of_durations_day5_first,day5_operations_first_priority,postponed_operations_to_day6);
    first_priority_day_5 = array_result_for_control;
end

[scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler_after_first(array_of_durations_day5_second,day5_operations_second_priority,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6);
second_priority_day_5 = array_result_for_control;

[scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler_after_first(array_of_durations_day5_third,day5_operations_third_priority,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6);
third_priority_day_5 = array_result_for_control;

[scheduled_first_room_day5,array_result_for_control,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6] = scheduler_after_first(array_of_durations_day5_fourth,day5_operations_fourth_priority,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5,postponed_operations_to_day6);
fourth_priority_day_5 = array_result_for_control;



schedulePrinter(scheduled_first_room_day1,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5);












