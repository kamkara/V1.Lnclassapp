class AddSubcripionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :payment, :string
  end
end
