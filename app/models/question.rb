class Question < ApplicationRecord
  belongs_to :exercice
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers
  validates_with QuestionValidator

  #validates :content, :explain_answer, :exercice_id, :user_id, presence: true
end
