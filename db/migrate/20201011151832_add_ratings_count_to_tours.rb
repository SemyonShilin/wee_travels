class AddRatingsCountToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :ratings_count, :integer
  end
end
