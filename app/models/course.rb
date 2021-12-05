class Course < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :projects 
    
    def instructors
        users.where(user_role: "Instructor")

    end  
    def students
        users.where(user_role: "Student")
    end      

    def tas
        users.where(user_role: "Teaching Assistant")
    end
end
