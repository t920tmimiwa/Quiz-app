class User < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :choices, through: :questions
    validates :uname, 
        uniqueness: true, 
        presence: true
end
