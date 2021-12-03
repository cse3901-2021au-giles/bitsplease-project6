class Course < ApplicationRecord
  before_validation :uppercase_course
  before_validation :uppercase_semester
  validates :course_no, presence: true, length: { maximum: 50 }
  validates :semester, inclusion: { in: %w[fall spring summer],
                                    message: '%{value} is not a semester' }
  has_one :instructor, class_name: 'user', foreign_key: 'instructor_id'
  has_many :users, through: :enrollments

  def upcase_course
    self.course_no = course_no.upcase
  end

  def upcase_semester
    self.email = semester.upcase
  end
end
