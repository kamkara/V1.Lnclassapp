class AnswseredQuestion < ApplicationRecord
  belongs_to :question
    belongs_to :answer, optional: true

    accepts_nested_attributes_for :answer
    accepts_nested_attributes_for :question
end
