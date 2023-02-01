classdef Operation < handle
    properties
        id
        patient
        availableInterval   %Available interval for scheduling an operation
                            %(object of type Interval)

        scheduledInterval   %Scheduled start time
                            %(object of type Interval)

        duration            %Length of the operation in minutes

        operationDay        %the day that the operation will be held
                            %initially no value is assigned to this
                            %property. It will take a value when the
                            %operation is scheduled.
        operationRoom       %newProp
                            
    end

    methods
        %constructor
        function operation = Operation(id,patient,availableInterval,duration,operationDay)
            operation.id = id;
            operation.patient = patient;
            operation.availableInterval = availableInterval;
            operation.duration = duration;
            operation.operationDay = operationDay;
            operation.operationRoom = 0;
            %no value is assigned to operation.ScheduledInterval
            
        end
        function setOperationRoom(self,roomNo)
            self.operationRoom = roomNo;
        end

        function setScheduleInterval(self,scheduledInterval) 
            %a setter method to scheduledInterval property to the object
            %Operation when it is scheduled.
            self.scheduledInterval = scheduledInterval;
        end

        function setAvailableInterval(self,availableInterval) 
            %a setter method to set availableInterval propert of the
            %object Iperation when the operation is to be postponed to the
            %next day.
            self.availableInterval = availableInterval;
        end
    end

end