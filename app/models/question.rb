class Question < ApplicationRecord
    belongs_to :user
    has_many :choices, dependent: :destroy
    validates :body, presence: true
=begin 
    validate :truecount
    
    def truecount
        a = choices.count
        if a == 1
            errors.add(:correct_answer, "a")
        end
    end
=end

    accepts_nested_attributes_for :choices, allow_destroy: true
end
