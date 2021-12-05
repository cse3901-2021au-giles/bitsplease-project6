class Team < ApplicationRecord
    has_and_belongs_to_many :users
    validates :name, presence: true, length: { maximum: 50 }

    def project_name
        @p=Project.find_by(id: project_id)
        @p.project_name unless @p.nil?
    end

    def course_users
        User.where(user_role: "Student") unless project_id.nil?
    end

    def edit_team
        true unless project_id.nil?
    end

end

