class CourseExercice < ApplicationRecord
  belongs_to :exercice
  belongs_to :course
end
