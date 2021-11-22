class AddUserLevelToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level_id, :uuid
  end
end
