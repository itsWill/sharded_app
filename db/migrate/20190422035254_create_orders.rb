class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :shop, foreign_key: true
      t.references :product, foreign_key: true
      t.string :customer_name
      t.string :customer_address

      t.timestamps
    end
  end
end
