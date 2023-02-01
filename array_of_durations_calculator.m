function  [array_of_durations_day1_first] = array_of_durations_calculator(day1_operations_first_priority)
    
    array_of_durations_day1_first = [];
    num_first_priority_operations = length(day1_operations_first_priority);
    for i = 1:num_first_priority_operations
        array_of_durations_day1_first(i) = day1_operations_first_priority{1,i}.duration; 
    end
    
    array_of_durations_day1_first = sort(array_of_durations_day1_first);
    size_day1_first = size(array_of_durations_day1_first);
    
    only_loop_purposes = day1_operations_first_priority;
    control_array = zeros(1,length(only_loop_purposes));
    for i = 1:size_day1_first(2)
        x = 0;
        for j = 1:num_first_priority_operations
            if only_loop_purposes{1,j}.duration == array_of_durations_day1_first(1,i) && x == 0
                if control_array(1,j) == 0
                    array_of_durations_day1_first(2,i) = j;
                    x = 1;
                    control_array(1,j) = 1;
                end
            end
        end
    end
end