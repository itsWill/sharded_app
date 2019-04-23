class AddCountryToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :country, :string
  end
end
