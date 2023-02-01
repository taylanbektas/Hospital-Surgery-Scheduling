function schedulePrinter(scheduled_first_room_day1,scheduled_second_room_day1,scheduled_third_room_day1,scheduled_fourth_room_day1,scheduled_fifth_room_day1,scheduled_first_room_day2,scheduled_second_room_day2,scheduled_third_room_day2,scheduled_fourth_room_day2,scheduled_fifth_room_day2,scheduled_first_room_day3,scheduled_second_room_day3,scheduled_third_room_day3,scheduled_fourth_room_day3,scheduled_fifth_room_day3,scheduled_first_room_day4,scheduled_second_room_day4,scheduled_third_room_day4,scheduled_fourth_room_day4,scheduled_fifth_room_day4,scheduled_first_room_day5,scheduled_second_room_day5,scheduled_third_room_day5,scheduled_fourth_room_day5,scheduled_fifth_room_day5);
    Real_Schedule = Schedule(Interval(0,480),5,5);
    
    for i = 1:length(scheduled_first_room_day1)
        scheduled_first_room_day1{i}.setOperationRoom(1);
        Real_Schedule.constructSchedule(scheduled_first_room_day1{i});
    end
    for i = 1:length(scheduled_second_room_day1)
        scheduled_second_room_day1{i}.setOperationRoom(2);
        Real_Schedule.constructSchedule(scheduled_second_room_day1{i});
    end
    for i = 1:length(scheduled_third_room_day1)
        scheduled_third_room_day1{i}.setOperationRoom(3);
        Real_Schedule.constructSchedule(scheduled_third_room_day1{i});
    end
    for i = 1:length(scheduled_fourth_room_day1)
        scheduled_fourth_room_day1{i}.setOperationRoom(4);
        Real_Schedule.constructSchedule(scheduled_fourth_room_day1{i});
    end
    for i = 1:length(scheduled_fifth_room_day1)
        scheduled_fifth_room_day1{i}.setOperationRoom(5);
        Real_Schedule.constructSchedule(scheduled_fifth_room_day1{i});
    end
    %day1_Schedule.printSchedule;
    for i = 1:length(scheduled_first_room_day2)
        scheduled_first_room_day2{i}.setOperationRoom(1);
        Real_Schedule.constructSchedule(scheduled_first_room_day2{i});
    end
    for i = 1:length(scheduled_second_room_day2)
        scheduled_second_room_day2{i}.setOperationRoom(2);
        Real_Schedule.constructSchedule(scheduled_second_room_day2{i});
    end
    for i = 1:length(scheduled_third_room_day2)
        scheduled_third_room_day2{i}.setOperationRoom(3);
        Real_Schedule.constructSchedule(scheduled_third_room_day2{i});
    end
    for i = 1:length(scheduled_fourth_room_day2)
        scheduled_fourth_room_day2{i}.setOperationRoom(4);
        Real_Schedule.constructSchedule(scheduled_fourth_room_day2{i});
    end
    for i = 1:length(scheduled_fifth_room_day2)
        scheduled_fifth_room_day2{i}.setOperationRoom(5);
        Real_Schedule.constructSchedule(scheduled_fifth_room_day2{i});
    end
    %day1_Schedule.printSchedule;
    for i = 1:length(scheduled_first_room_day3)
        scheduled_first_room_day3{i}.setOperationRoom(1);
        Real_Schedule.constructSchedule(scheduled_first_room_day3{i});
    end
    for i = 1:length(scheduled_second_room_day3)
        scheduled_second_room_day3{i}.setOperationRoom(2);
        Real_Schedule.constructSchedule(scheduled_second_room_day3{i});
    end
    for i = 1:length(scheduled_third_room_day3)
        scheduled_third_room_day3{i}.setOperationRoom(3);
        Real_Schedule.constructSchedule(scheduled_third_room_day3{i});
    end
    for i = 1:length(scheduled_fourth_room_day3)
        scheduled_fourth_room_day3{i}.setOperationRoom(4);
        Real_Schedule.constructSchedule(scheduled_fourth_room_day3{i});
    end
    for i = 1:length(scheduled_fifth_room_day3)
        scheduled_fifth_room_day3{i}.setOperationRoom(5);
        Real_Schedule.constructSchedule(scheduled_fifth_room_day3{i});
    end
    %day1_Schedule.printSchedule;
    for i = 1:length(scheduled_first_room_day4)
        scheduled_first_room_day4{i}.setOperationRoom(1);
        Real_Schedule.constructSchedule(scheduled_first_room_day4{i});
    end
    for i = 1:length(scheduled_second_room_day4)
        scheduled_second_room_day4{i}.setOperationRoom(2);
        Real_Schedule.constructSchedule(scheduled_second_room_day4{i});
    end
    for i = 1:length(scheduled_third_room_day4)
        scheduled_third_room_day4{i}.setOperationRoom(3);
        Real_Schedule.constructSchedule(scheduled_third_room_day4{i});
    end
    for i = 1:length(scheduled_fourth_room_day4)
        scheduled_fourth_room_day4{i}.setOperationRoom(4);
        Real_Schedule.constructSchedule(scheduled_fourth_room_day4{i});
    end
    for i = 1:length(scheduled_fifth_room_day4)
        scheduled_fifth_room_day4{i}.setOperationRoom(5);
        Real_Schedule.constructSchedule(scheduled_fifth_room_day4{i});
    end
    %day1_Schedule.printSchedule;
    for i = 1:length(scheduled_first_room_day5)
        scheduled_first_room_day5{i}.setOperationRoom(1);
        Real_Schedule.constructSchedule(scheduled_first_room_day5{i});
    end
    for i = 1:length(scheduled_second_room_day5)
        scheduled_second_room_day5{i}.setOperationRoom(2);
        Real_Schedule.constructSchedule(scheduled_second_room_day5{i});
    end
    for i = 1:length(scheduled_third_room_day5)
        scheduled_third_room_day5{i}.setOperationRoom(3);
        Real_Schedule.constructSchedule(scheduled_third_room_day5{i});
    end
    for i = 1:length(scheduled_fourth_room_day5)
        scheduled_fourth_room_day5{i}.setOperationRoom(4);
        Real_Schedule.constructSchedule(scheduled_fourth_room_day5{i});
    end
    for i = 1:length(scheduled_fifth_room_day5)
        scheduled_fifth_room_day5{i}.setOperationRoom(5);
        Real_Schedule.constructSchedule(scheduled_fifth_room_day5{i});
    end
    Real_Schedule.printSchedule;






























end
