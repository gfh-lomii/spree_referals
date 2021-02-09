class AddNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_orders, :referal_delivered, :boolean, default: false
  end
end
