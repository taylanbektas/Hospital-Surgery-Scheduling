classdef Schedule < handle
    properties
        dailyPlanningHorizon %planning horizon in a day that the event can be scheduled
                             %(object of type interval)

        planningDays         %total number of days that the schedule will be planned
        
        numberOfRooms        %Number of rooms on hand

        finalSchedule        %The cell array of scheduled operations 
                             %(initially no value is assigned to this property)
                             %This property will take a value after the
                             %schedule has generated.
    end

    methods
        %constructor
        function schedule = Schedule(dailyPlanningHorizon,planningDays,numberOfRooms)
            schedule.dailyPlanningHorizon = dailyPlanningHorizon;
            schedule.planningDays = planningDays;
            schedule.numberOfRooms = numberOfRooms;
            schedule.finalSchedule = {};
        end

        function constructSchedule(self,operation)
            self.finalSchedule{length(self.finalSchedule)+1} =operation;
        end

        function printSchedule(self) 
            fprintf(" Room No  | Available Interval   | Duration(min) | Sched. Interval | Patient Name | Patient Surname | Patient Priority | Operation Day\n");
            last = length(self.finalSchedule);
            for i = 1:last
                fprintf("        %.0f       |      (%.0f,%.0f)          |     %.0f      |    (%.0f,%.0f)            |         %s        |        %s        |          %.0f            |          %.0f \n",self.finalSchedule{1,i}.operationRoom,self.finalSchedule{1,i}.availableInterval.left,self.finalSchedule{1,i}.availableInterval.right,self.finalSchedule{1,i}.duration,self.finalSchedule{1,i}.scheduledInterval.left,self.finalSchedule{1,i}.scheduledInterval.right,self.finalSchedule{1,i}.patient.name,self.finalSchedule{1,i}.patient.surname,self.finalSchedule{1,i}.patient.priority,self.finalSchedule{1,i}.patient.day);
                fprintf("\n");
            end 
        end
    end
end


