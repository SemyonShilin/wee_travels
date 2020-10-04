class AddPriceToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :price, :decimal, precision: 15, scale: 2
  end
end
