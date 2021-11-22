class RenameSchoolNameToSchoolIdFromUSer < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :school_name, :school_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
