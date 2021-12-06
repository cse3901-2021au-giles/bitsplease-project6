class Team < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :grades, :dependent => :destroy
    validates :name, presence: true, length: { maximum: 50 }

    def project_name
        @p=Project.find_by(id: project_id)
        @p.project_name unless @p.nil?
    end
    def course_no
        @p=Project.find_by(id: project_id)
        @c=Course.find_by(id: @p.course_id)
        @c.course_no unless @c.nil?
    end

    def course_users
        #User.where(user_role: "Student") unless project_id.nil?
        #byebug
        @project=Project.find_by(id: project_id)
        @course=Course.find_by(id: @project.course_id)
        @users=@course.users.where(user_role: "Student");

    end

    def course_admins
        #User.where(user_role: "Student") unless project_id.nil?
        #byebug
        @project=Project.find_by(id: project_id)
        @course=Course.find_by(id: @project.course_id)
        @admins=@course.users.where(user_role: ["Instructor","Teaching Assitant"]);
    end

end

