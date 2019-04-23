class CreateAdminReports < ActiveRecord::Migration[6.0]
  mark_as_master_migration!

  def change
    create_table :admin_reports do |t|
      t.integer :orders_count
      t.integer :shops_count
      t.integer :products_count
      t.timestamps
    end
  end
end
