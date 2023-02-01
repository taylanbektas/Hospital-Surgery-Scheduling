function [scheduled_first_room,result_array_for_control,scheduled_second_room,scheduled_third_room,scheduled_fourth_room,scheduled_fifth_room,postponed_operations_to_day] = scheduler(array_of_durations_day1_first,day1_operations_first_priority,postponed_operations_to_day)


    size_day1_first = size(array_of_durations_day1_first);
    aimed_Interval = Interval(day1_operations_first_priority{1,size_day1_first(2)-1}.availableInterval.left,day1_operations_first_priority{1,size_day1_first(2)-1}.availableInterval.left+day1_operations_first_priority{1,size_day1_first(2)-1}.duration);
    day1_operations_first_priority{1,size_day1_first(2)-1}.setScheduleInterval(aimed_Interval);
    scheduled_first_room = {day1_operations_first_priority{1,size_day1_first(2)-1}};
    result_array_for_control{1,1}=day1_operations_first_priority{1,size_day1_first(2)-1}.availableInterval;
    result_array_for_control{1,2}=day1_operations_first_priority{1,size_day1_first(2)-1}.scheduledInterval;
    result_array_for_control{1,3}= 1;
    scheduled_second_room = {};
    scheduled_third_room = {};
    scheduled_fourth_room = {};
    scheduled_fifth_room = {};
    next_room_operations_to_second = {};
    next_room_operations_to_third = {};
    next_room_operations_to_fourth = {};
    next_room_operations_to_fifth = {};
    postponed_operations_to_day = {};

    m = 0;
    for i = size_day1_first(2)-1:-1:1
        operation_num = array_of_durations_day1_first(2,i);
        obj = day1_operations_first_priority{1,operation_num};
        len = length(scheduled_first_room);
        not_intersection_other = obj.availableInterval;
        control =0 ;
        
     
        for j = 1:len
            a = 0;
            b = 0;
            if control == 0
                if scheduled_first_room{j}.scheduledInterval.isIn(not_intersection_other) ==1
                    
                    trial_interval_last = Interval(not_intersection_other.right-day1_operations_first_priority{1,operation_num}.duration,not_intersection_other.right);
                    trial_interval_begin = Interval(not_intersection_other.left,not_intersection_other.left+day1_operations_first_priority{1,operation_num}.duration);
                    if control == 0
                        if scheduled_first_room{j}.scheduledInterval.isIn(trial_interval_last)==1 || scheduled_first_room{j}.scheduledInterval.isIntersect(trial_interval_last)==1
                            a = 1;
                        end
                        if scheduled_first_room{j}.scheduledInterval.isIn(trial_interval_begin)==1 || scheduled_first_room{j}.scheduledInterval.isIntersect(trial_interval_begin)==1
                            b = 1;
                        end
                        if a== 0 && b == 1
                            not_intersection_other = trial_interval_last;
                        elseif a==1 && b==0
                            not_intersection_other = trial_interval_begin;
                        elseif a==0 && b== 0
                            right_width =  trial_interval_last.getWidth;
                            left_width = trial_interval_begin.getWidth;
                            
                          
                            if right_width > duration && left_width < duration
                                not_intersection_other = trial_interval_last; %problem
                            elseif left_width > duration && right_width < duration 
                                not_intersection_other = trial_interval_begin;
                            elseif left_width < duration && right_width<duration
                                control =1 ;
                            elseif left_width >= duration && right_width >= duration
                                if abs(left_width-duration) > abs(right_width-duration)
                                    not_intersection_other = trial_interval_last;
                                else
                                    not_intersection_other = trial_interval_begin;
                                end
                            end
                        
                        elseif a==1 && b==1
                            control = 1;
                        end
    
                    end
                elseif not_intersection_other.isIn(scheduled_first_room{j}.scheduledInterval)
                    control =1;
                
                
                elseif scheduled_first_room{j}.scheduledInterval.isIntersect(not_intersection_other) == 1
                    not_intersection_other = scheduled_first_room{j}.scheduledInterval.After_Intersection(not_intersection_other);
                    if not_intersection_other.getWidth < obj.duration
                        control = 1;
                    end
                
       
    
                end
    
            end
    
        end
        if control == 0 %it is scheduled that day first room
            obj.setScheduleInterval(Interval(not_intersection_other.left,not_intersection_other.left+day1_operations_first_priority{1,operation_num}.duration));
            scheduled_first_room{len+1} =obj;
            result_array_for_control{len+1,1} = obj.availableInterval;
            result_array_for_control{len+1,2} = obj.scheduledInterval;
            result_array_for_control{len+1,3} = 1;

        elseif control == 1 %it could not be scheduled that day first room, so go second room
            m = m+1;
            next_room_operations_to_second{m} = obj;
        end
    end
    
    if length(next_room_operations_to_second) ~= 0
        aimed_Interval = Interval(next_room_operations_to_second{1}.availableInterval.left,next_room_operations_to_second{1}.availableInterval.left+next_room_operations_to_second{1}.duration);
        next_room_operations_to_second{1}.setScheduleInterval(aimed_Interval);
        scheduled_second_room{1} = next_room_operations_to_second{1};
        result_array_for_control{length(scheduled_first_room)+1,1}=next_room_operations_to_second{1}.availableInterval;
        result_array_for_control{length(scheduled_first_room)+1,2}=next_room_operations_to_second{1}.scheduledInterval;
        result_array_for_control{length(scheduled_first_room)+1,3} = 2;
        n = 1;
        m =0;
        for i = 2:length(next_room_operations_to_second)
            obj = next_room_operations_to_second{i};
            len = length(scheduled_second_room);
            not_intersection_other = obj.availableInterval;
            control =0 ;
            
            for j = 1:len
                a = 0;
                b = 0;
                if control == 0
                    if scheduled_second_room{j}.scheduledInterval.isIn(not_intersection_other) ==1
                        
                        trial_interval_last = Interval(not_intersection_other.right-obj.duration,not_intersection_other.right);
                        trial_interval_begin = Interval(not_intersection_other.left,not_intersection_other.left+obj.duration);
                        if control == 0
                            if scheduled_second_room{j}.scheduledInterval.isIn(trial_interval_last)==1 || scheduled_second_room{j}.scheduledInterval.isIntersect(trial_interval_last)==1
                                a = 1;
                            end
                            if scheduled_second_room{j}.scheduledInterval.isIn(trial_interval_begin)==1 || scheduled_second_room{j}.scheduledInterval.isIntersect(trial_interval_begin)==1
                                b = 1;
                            end
                            if a== 0 && b == 1
                                not_intersection_other = trial_interval_last;
                            elseif a==1 && b==0
                                not_intersection_other = trial_interval_begin;
                            elseif a==0 && b== 0
                                right_width =  trial_interval_last.getWidth;
                                left_width = trial_interval_begin.getWidth;
                                
                              
                                if right_width > duration && left_width < duration
                                    not_intersection_other = trial_interval_last; %problem
                                elseif left_width > duration && right_width < duration 
                                    not_intersection_other = trial_interval_begin;
                                elseif left_width < duration && right_width<duration
                                    control =1 ;
                                elseif left_width >= duration && right_width >= duration
                                    if abs(left_width-duration) > abs(right_width-duration)
                                        not_intersection_other = trial_interval_last;
                                    else
                                        not_intersection_other = trial_interval_begin;
                                    end
                                end
                            
                            elseif a==1 && b==1
                                %{
                                added_interval = obj.availableInterval.add(scheduled_second_room{j}.scheduledInterval)
                                if added_interval.getWidth >= obj.duration + scheduled_second_room{j}.duration
                                    if added_interval.left == obj.availableInterval.left && added_interval.right == scheduled_second_room{j}.availableInterval.right
                                        not_intersection_other = Interval(obj.availableInterval.left,obj.availableInterval.left+obj.availableInterval.getWidth);
                                        scheduled_second_room{j}.scheduledInterval = Interval(scheduled_second_room{j}.availableInterval.right-scheduled_second_room{j}.duration,scheduled_second_room{j}.availableInterval.right);
                                    elseif added.interval.left == scheduled_second_room{j}.availableInterval.left && added_interval.right == obj.availableInterval.right
                                        not_intersection_other = Interval(obj.availableInterval.right-obj.duration,obj.availableInterval.right);
                                        scheduled_second_room{j}.scheduledInterval = Interval(scheduled_second_room{j}.availableInterval.left,scheduled_second_room{j}.availableInterval.left+scheduled_second_room{j}.duration);
                                %}
                                control = 1;
                            end
        
                        end
                    elseif not_intersection_other.isIn(scheduled_second_room{j}.scheduledInterval)
                        control =1;
                    
                    
                    elseif scheduled_second_room{j}.scheduledInterval.isIntersect(not_intersection_other) == 1
                        not_intersection_other = scheduled_second_room{j}.scheduledInterval.After_Intersection(not_intersection_other);
                        if not_intersection_other.getWidth < obj.duration
                            control = 1;
                        end
                    
           
        
                    end
        
                end
        
            end
            if control == 0 %it is scheduled that day first room
                n=n+1;
                obj.setScheduleInterval(Interval(not_intersection_other.left,not_intersection_other.left+obj.duration));
                scheduled_second_room{len+1} =obj;
                result_array_for_control{length(scheduled_first_room)+n,1} = obj.availableInterval;
                result_array_for_control{length(scheduled_first_room)+n,2} = obj.scheduledInterval;
                result_array_for_control{length(scheduled_first_room)+n,3} = 2;

            elseif control == 1 %it could not be scheduled that day first room, so go second room
                m = m+1;
                next_room_operations_to_third{m} = obj;
            end
        end
    end
   
    if length(next_room_operations_to_third) ~= 0
        aimed_Interval = Interval(next_room_operations_to_third{1}.availableInterval.left,next_room_operations_to_third{1}.availableInterval.left+next_room_operations_to_third{1}.duration);
        next_room_operations_to_third{1}.setScheduleInterval(aimed_Interval);
        scheduled_third_room{1} = next_room_operations_to_third{1};
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+1,1}=next_room_operations_to_third{1}.availableInterval;
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+1,2}=next_room_operations_to_third{1}.scheduledInterval;
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+1,3} = 3;

        n = 1;
        m = 0;
        for i = 2:length(next_room_operations_to_third)
            obj = next_room_operations_to_third{i};
            len = length(scheduled_third_room);
            not_intersection_other = obj.availableInterval;
            control =0;
            
            
            for j = 1:len
                a = 0;
                b = 0;
                if control == 0
                    if scheduled_third_room{j}.scheduledInterval.isIn(not_intersection_other) ==1
                        
                        trial_interval_last = Interval(not_intersection_other.right-day1_obj.duration,not_intersection_other.right);
                        trial_interval_begin = Interval(not_intersection_other.left,not_intersection_other.left+obj.duration);
                        if control == 0
                            if scheduled_third_room{j}.scheduledInterval.isIn(trial_interval_last)==1 || scheduled_third_room{j}.scheduledInterval.isIntersect(trial_interval_last)==1
                                a = 1;
                            end
                            if scheduled_third_room{j}.scheduledInterval.isIn(trial_interval_begin)==1 || scheduled_third_room{j}.scheduledInterval.isIntersect(trial_interval_begin)==1
                                b = 1;
                            end
                            if a== 0 && b == 1
                                not_intersection_other = trial_interval_last;
                            elseif a==1 && b==0
                                not_intersection_other = trial_interval_begin;
                            elseif a==0 && b== 0
                                right_width =  trial_interval_last.getWidth;
                                left_width = trial_interval_begin.getWidth;
                                
                              
                                if right_width > duration && left_width < duration
                                    not_intersection_other = trial_interval_last; %problem
                                elseif left_width > duration && right_width < duration 
                                    not_intersection_other = trial_interval_begin;
                                elseif left_width < duration && right_width<duration
                                    control =1 ;
                                elseif left_width >= duration && right_width >= duration
                                    if abs(left_width-duration) > abs(right_width-duration)
                                        not_intersection_other = trial_interval_last;
                                    else
                                        not_intersection_other = trial_interval_begin;
                                    end
                                end
                            
                            elseif a==1 && b==1
                                control = 1;
                            end
        
                        end
                    elseif not_intersection_other.isIn(scheduled_third_room{j}.scheduledInterval)
                        control =1;
                    
                    
                    elseif scheduled_third_room{j}.scheduledInterval.isIntersect(not_intersection_other) == 1
                        not_intersection_other = scheduled_third_room{j}.scheduledInterval.After_Intersection(not_intersection_other);
                        if not_intersection_other.getWidth < obj.duration
                            control = 1;
                        end
                    
           
        
                    end
        
                end
        
            end
            if control == 0 %it is scheduled that day first room
                n = n+1;
                obj.setScheduleInterval(Interval(not_intersection_other.left,not_intersection_other.left+obj.duration));
                scheduled_third_room{len+1} =obj;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+n,1} = obj.availableInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+n,2} = obj.scheduledInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+n,3}= 3;

            elseif control == 1 %it could not be scheduled that day first room, so go second room
                m = m+1;
                next_room_operations_to_fourth{m} = obj;
            end
        end
    end


    if length(next_room_operations_to_fourth) ~= 0
        aimed_Interval = Interval(next_room_operations_to_fourth{1}.availableInterval.left,next_room_operations_to_fourth{1}.availableInterval.left+next_room_operations_to_fourth{1}.duration);
        next_room_operations_to_fourth{1}.setScheduleInterval(aimed_Interval);
        scheduled_fourth_room{1} = next_room_operations_to_fourth{1};
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+1,1}=next_room_operations_to_fourth{1}.availableInterval;
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+1,2}=next_room_operations_to_fourth{1}.scheduledInterval;
        n = 1;
        m = 0;
        for i = 2:length(next_room_operations_to_fourth)
            obj = next_room_operations_to_fourth{i};
            len = length(scheduled_fourth_room);
            not_intersection_other = obj.availableInterval;
            control =0 ;
            
    
            for j = 1:len
                a = 0;
                b = 0;
                if control == 0
                    if scheduled_fourth_room{j}.scheduledInterval.isIn(not_intersection_other) ==1
                        
                        trial_interval_last = Interval(not_intersection_other.right-day1_obj.duration,not_intersection_other.right);
                        trial_interval_begin = Interval(not_intersection_other.left,not_intersection_other.left+obj.duration);
                        if control == 0
                            if scheduled_fourth_room{j}.scheduledInterval.isIn(trial_interval_last)==1 || scheduled_fourth_room{j}.scheduledInterval.isIntersect(trial_interval_last)==1
                                a = 1;
                            end
                            if scheduled_fourth_room{j}.scheduledInterval.isIn(trial_interval_begin)==1 || scheduled_fourth_room{j}.scheduledInterval.isIntersect(trial_interval_begin)==1
                                b = 1;
                            end
                            if a== 0 && b == 1
                                not_intersection_other = trial_interval_last;
                            elseif a==1 && b==0
                                not_intersection_other = trial_interval_begin;
                            elseif a==0 && b== 0
                                right_width =  trial_interval_last.getWidth;
                                left_width = trial_interval_begin.getWidth;
                                
                              
                                if right_width > duration && left_width < duration
                                    not_intersection_other = trial_interval_last; %problem
                                elseif left_width > duration && right_width < duration 
                                    not_intersection_other = trial_interval_begin;
                                elseif left_width < duration && right_width<duration
                                    control =1 ;
                                elseif left_width >= duration && right_width >= duration
                                    if abs(left_width-duration) > abs(right_width-duration)
                                        not_intersection_other = trial_interval_last;
                                    else
                                        not_intersection_other = trial_interval_begin;
                                    end
                                end
                            
                            elseif a==1 && b==1
                                control = 1;
                            end
        
                        end
                    elseif not_intersection_other.isIn(scheduled_fourth_room{j}.scheduledInterval)
                        control =1;
                    
                    
                    elseif scheduled_fourth_room{j}.scheduledInterval.isIntersect(not_intersection_other) == 1
                        not_intersection_other = scheduled_fourth_room{j}.scheduledInterval.After_Intersection(not_intersection_other);
                        if not_intersection_other.getWidth < obj.duration
                            control = 1;
                        end
                    
           
        
                    end
        
                end
        
            end
            if control == 0 %it is scheduled that day first room
                n = n+1;
                obj.setScheduleInterval(Interval(not_intersection_other.left,not_intersection_other.left+obj.duration));
                scheduled_fourth_room{len+1} =obj;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+len+1,1} = obj.availableInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+len+1,1} = obj.scheduledInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+len+1,1} = 4;

            elseif control == 1 %it could not be scheduled that day first room, so go second room
                m = m+1;
                next_room_operations_to_fifth{m} = obj;
            end
        end
    end


    if length(next_room_operations_to_fifth) ~= 0
        aimed_Interval = Interval(next_room_operations_to_fifth{1}.availableInterval.left,next_room_operations_to_fifth{1}.availableInterval.left+next_room_operations_to_fifth{1}.duration);
        next_room_operations_to_fifth{1}.setScheduleInterval(aimed_Interval);
        scheduled_fifth_room{1} = next_room_operations_to_fifth{1};
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+length(scheduled_fourth_room)+1,1}=next_room_operations_to_fifth{1}.availableInterval;
        result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+length(scheduled_fourth_room)+1,2}=next_room_operations_to_fifth{1}.scheduledInterval;

        n = 1;
        m = 0;
        for i = 2:length(next_room_operations_to_fifth)
            obj = next_room_operations_to_fifth{i};
            len = length(scheduled_fifth_room);
            not_intersection_other = obj.availableInterval;
            control =0 ;
            m = 0;
    
            for j = 1:len
                a = 0;
                b = 0;
                if control == 0
                    if scheduled_fifth_room{j}.scheduledInterval.isIn(not_intersection_other) ==1
                        
                        trial_interval_last = Interval(not_intersection_other.right-day1_obj.duration,not_intersection_other.right);
                        trial_interval_begin = Interval(not_intersection_other.left,not_intersection_other.left+obj.duration);
                        if control == 0
                            if scheduled_fifth_room{j}.scheduledInterval.isIn(trial_interval_last)==1 || scheduled_fifth_room{j}.scheduledInterval.isIntersect(trial_interval_last)==1
                                a = 1;
                            end
                            if scheduled_fifth_room{j}.scheduledInterval.isIn(trial_interval_begin)==1 || scheduled_fifth_room{j}.scheduledInterval.isIntersect(trial_interval_begin)==1
                                b = 1;
                            end
                            if a== 0 && b == 1
                                not_intersection_other = trial_interval_last;
                            elseif a==1 && b==0
                                not_intersection_other = trial_interval_begin;
                            elseif a==0 && b== 0
                                right_width =  trial_interval_last.getWidth;
                                left_width = trial_interval_begin.getWidth;
                                
                              
                                if right_width > duration && left_width < duration
                                    not_intersection_other = trial_interval_last; %problem
                                elseif left_width > duration && right_width < duration 
                                    not_intersection_other = trial_interval_begin;
                                elseif left_width < duration && right_width<duration
                                    control =1 ;
                                elseif left_width >= duration && right_width >= duration
                                    if abs(left_width-duration) > abs(right_width-duration)
                                        not_intersection_other = trial_interval_last;
                                    else
                                        not_intersection_other = trial_interval_begin;
                                    end
                                end
                            
                            elseif a==1 && b==1
                                control = 1;
                            end
        
                        end
                    elseif not_intersection_other.isIn(scheduled_fifth_room{j}.scheduledInterval)
                        control =1;
                    
                    
                    elseif scheduled_fifth_room{j}.scheduledInterval.isIntersect(not_intersection_other) == 1
                        not_intersection_other = scheduled_fifth_room{j}.scheduledInterval.After_Intersection(not_intersection_other);
                        if not_intersection_other.getWidth < obj.duration
                            control = 1;
                        end
                    
           
        
                    end
        
                end
        
            end
            if control == 0 %it is scheduled that day first room
                n = n+1;
                obj.setScheduleInterval(Interval(not_intersection_other.left,not_intersection_other.left+obj.duration));
                scheduled_fifth_room{len+1} =obj;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+length(scheduled_fourth_room)+len+1,1} = obj.availableInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+length(scheduled_fourth_room)+len+1,1} = obj.scheduledInterval;
                result_array_for_control{length(scheduled_first_room)+length(scheduled_second_room)+length(scheduled_third_room)+length(scheduled_fourth_room)+len+1,1} = 5;

            elseif control == 1 %it could not be scheduled that day first room, so go second room
                m = m+1;
                obj.patient.priority = 0;
                obj.setAvailableInterval(0,obj.duration);
                obj.patient.day = obj.patient.day+1;
                postponed_operations_to_day = {postponed_operations_to_day obj};
                %postponed_operations_to_day{m} = obj;
            end
        end
    end
    
    



    



end