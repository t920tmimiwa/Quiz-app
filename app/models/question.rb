class Question < ApplicationRecord
    belongs_to :user
    
    
    def right_answer?(reply)
        return self.correct_answer == reply
    end
end
