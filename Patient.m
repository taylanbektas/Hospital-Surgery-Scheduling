classdef Patient < handle
    properties
        id
        name
        surname
        priority 
        day  %the day that the patient initially listed to have an operation
        beforePostponedPriority
    end

    methods
        %constructor
        function patient = Patient(id,name,surname,priority,day)
            patient.id = id;
            patient.name = name;
            patient.surname = surname;
            patient.priority = priority;
            patient.day = day;
            patient.beforePostponedPriority = priority;
        end
        
        function priority = getPatientPriority(self) 
            priority = self.priority;
        end

        function setPatientPriority(self,new_priority)
            self.priority = new_priority;
        end

        function day = getPatientDay(self)
            day = self.day;
        end

        function setPatientDay(self,new_day) 
            self.day = new_day;
        end
    end
end
