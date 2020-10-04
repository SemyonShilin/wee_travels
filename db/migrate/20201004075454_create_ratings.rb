class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.belongs_to :tour, index: true, foreign_key: true
      t.string :comment
      t.integer :value

      t.timestamps
    end
  end
end
