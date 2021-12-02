class AddResultToAnsweredQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :answered_questions, :result, null: false, foreign_key: true, type: :uuid
  end
  
end
