class CreateReferals < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_referals do |t|
      t.string :code
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :active, default: true
      t.datetime :deleted_at
      t.timestamps
    end

    add_reference :spree_orders, :spree_referal, index: true, foreign_key: true
    add_index :spree_referals, :deleted_at
  end
end
