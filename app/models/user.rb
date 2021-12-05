class User < ApplicationRecord
    before_save { email.downcase! }
    has_and_belongs_to_many :teams
    has_many :student_grades, class_name: 'Grade', foreign_key: 'student_id'
    has_many :reviewer_grades, class_name: 'Grade', foreign_key: 'reviewer_id'


    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password

  
    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def user_display
        "#{name} (#{user_role})"
    end

    def students
        users.where(user_role: "Student")
    end
        
end
