class Grade < ApplicationRecord
  validates :score, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  belongs_to :student, class_name: 'user'
  has_one :project
end
