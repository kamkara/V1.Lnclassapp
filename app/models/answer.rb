class Answer < ApplicationRecord
  belongs_to :question

 #validates :content, :correct_answer, :question_id, presence: true
end
