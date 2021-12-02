class RenameAnswseredQuestionsToAnsweredQuestions < ActiveRecord::Migration[6.1]
  def change
    rename_column :answsered_questions, :answered_questions
  end
end
