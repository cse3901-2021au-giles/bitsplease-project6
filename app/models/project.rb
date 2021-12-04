class Project < ApplicationRecord
  belongs_to :course
  validates :course_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  has_many :teams
end
