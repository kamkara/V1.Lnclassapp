class AddMaterialToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :material_id, :uuid
  end
end
