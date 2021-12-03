class Project < ApplicationRecord
  validates :project_name, presence: true, length: { maximum: 50 }
  belongs_to :course
end
