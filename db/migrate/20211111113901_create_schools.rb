class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
