class CreateJoinTableCoursesExercices < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :exercices, column_options: { null: false, type: :uuid}
  end
end
