class Grade < ApplicationRecord
    belongs_to :student, class_name: 'User'
    belongs_to :reviewer, class_name: 'User'
    belongs_to :team, class_name: "Team"

    validates :score, presence: true
    validates :remarks, presence: true, length: { maximum: 500 }



    def student_name
        @s=User.find_by(id: student_id)
        @s.name unless @s.nil?
    end

    def team_name
        @t=Team.find_by(id: team_id)
        @t.name unless @t.nil?
    end
    def reviewer_name
        @s=User.find_by(id: reviewer_id)
        @s.name unless @s.nil?       
    end

    def project_name
        @t=Team.find_by(id: team_id)
        @p=Project.find_by(id: @t.project_id)
        @p.project_name unless @p.nil?
    end
    def project_id
        @t=Team.find_by(id: team_id)
        @t.project_id unless @t.nil?
    end    
    def course_no
        @t=Team.find_by(id: team_id)
        @p=Project.find_by(id: @t.project_id)
        @c=Course.find_by(id: @p.course_id)        
        @c.course_no unless @c.nil?
    end
    def course_id
        @t=Team.find_by(id: team_id)
        @p=Project.find_by(id: @t.project_id)
        @p.course_id unless @p.nil?
    end
    def course
        @t=Team.find_by(id: team_id)
        @p=Project.find_by(id: @t.project_id)
        Course.find_by(id: @p.course_id)        
    end
    def grade_date
        updated_at.strftime("%m/%d/%Y")
    end
end
