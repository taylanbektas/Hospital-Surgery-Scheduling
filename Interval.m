classdef Interval < handle
% An Interval has a left endpoint and a right endpoint.
    
    properties
       left
       right
    end
    
    methods
        function Inter = Interval(lt, rt)
        % Constructor:  construct an Interval object
            Inter.left= lt;
            Inter.right= rt;
        end
        
        function w = getWidth(self)
        % Return the width of the Interval
            %%%% %MISSION Write your code below %%%%
            w = self.right - self.left;
            
        end
        
        function scale(self, f)
        % Scale self by a factor f
            %%%% %MISSION Write your code below %%%%
            self.left = self.left * f;
            self.right = self.right * f;
        end
        
        function shift(self, s)
        % Shift self by constant s
            %%%% %MISSION Write your code below %%%%
            self.left = self.left + s;
            self.right = self.right + s;
             
        end
        
        function tf = isIn(self, other)
        % tf is true (1) if self is in the other Interval
            %%%% %MISSION Write your code below %%%%
            if (self.left >= other.left) && (self.right <= other.right)
                tf = 1;
            else
                tf = 0;
            end
        
        end
        
        function Inter = add(self, other)
        % Inter is the new Interval formed by adding self and the 
        % the other Interval
            %%%% %MISSION Write your code below %%%%
            if self.left < other.left
                Inter.left = self.left;
            else
                Inter.left = other.left;
            end
            if self.right > other.right
                Inter.right = self.right;
            else
                Inter.right = other.right;
            end
            
        end

        function boolean = isIntersect(self,other)
            %new func
            if self.left <= other.left && self.right <= other.right && self.right>=other.left
                boolean = 1;
            elseif other.left <= self.left && other.right <= self.right && other.right>=self.left
                boolean = 1;
            else
                boolean = 0;
            end
        end
        function [not_intersection_other] = After_Intersection(self,other)
            %new func
            if self.left <= other.left && self.right>=other.left && self.right<= other.right
                %not_intersection_self = Interval(self.left,other.left);
                not_intersection_other = Interval(self.right,other.right);
            elseif self.left >= other.left && other.right>=self.left && self.right>=other.right
                %not_intersection_self = Interval(other.left,self.left);
                not_intersection_other = Interval(other.left,self.left);
            end
        end

        
        function disp(self)
        % Display self, if not empty, in this format: (left,right)
        % If empty, display 'Empty <classname>'
            if isempty(self)
                fprintf('Empty %s\n', class(self))
            else
                fprintf('(%f,%f)\n', self.left, self.right)
            end
        end
        
    end %methods
    
end %classdef