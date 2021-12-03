class Feedback < ApplicationRecord
  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  belongs_to :receiver, class_name: 'user', foreign_key: 'user_id'
  has_one :submitter, class_name: 'user', foreign_key: 'user_id'
  has_one :project, class_name: 'project', foreign_key: 'project_id'
end
