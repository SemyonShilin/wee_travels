class AddRatingToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :rating, :decimal, precision: 3, scale: 2
  end
end
