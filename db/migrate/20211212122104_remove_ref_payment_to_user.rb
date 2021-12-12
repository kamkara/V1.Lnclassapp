class RemoveRefPaymentToUser < ActiveRecord::Migration[6.1]
  
  def change
    remove_column :users, :ref_payment
  end
end
