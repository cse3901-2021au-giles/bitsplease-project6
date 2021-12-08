class Team < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :grades, :dependent => :destroy
    validates :name, presence: true, length: { maximum: 50 }
    validates :project_id, presence: true

    def project
        @p=Project.find_by(id: project_id) if @p.nil?
    end
    def project_name
        @p=Project.find_by(id: project_id) if @p.nil?
        @p.project_name unless @p.nil?
    end
    def course_no
        @p=Project.find_by(id: project_id) if @p.nil?
        @c=Course.find_by(id: @p.course_id) if @c.nil?
        @c.course_no unless @c.nil?
    end

    def course_users
        @p=Project.find_by(id: project_id) if @p.nil?
        @c=Course.find_by(id: @p.course_id) if @c.nil?
        @users=@c.users.where(user_role: "Student");

    end

    def course_admins
        @p=Project.find_by(id: project_id) if @p.nil?
        @c=Course.find_by(id: @p.course_id) if @c.nil?
        @admins=@course.users.where(user_role: ["Instructor","Teaching Assitant"]);
    end

end

