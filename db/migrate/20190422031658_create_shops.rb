class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :domain
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
