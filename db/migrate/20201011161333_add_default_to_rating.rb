class AddDefaultToRating < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tours, :rating, 0.0
  end
end
