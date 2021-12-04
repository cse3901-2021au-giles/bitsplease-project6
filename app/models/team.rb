class Team < ApplicationRecord
    has_and_belongs_to_many :users
    validates :name, presence: true, length: { maximum: 50 }

    def project_name
        @p=Project.find_by(id: project_id)
        @p.project_name unless @p.nil?

    end
end

