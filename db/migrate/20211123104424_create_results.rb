class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :exercice, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end

end
