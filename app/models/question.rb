class Question < ApplicationRecord
  belongs_to :exercice
  belongs_to :user
end
