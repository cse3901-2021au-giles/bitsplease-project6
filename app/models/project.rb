class Project < ApplicationRecord
  belongs_to :course
  validates :course_id, presence: true
  validates :project_name, presence: true, length: { maximum: 50 }
  has_many :teams, :dependent => :destroy


  def course_no
    @c=Course.find_by(id: course_id)
    @c.course_no unless @c.nil?
  end
end
