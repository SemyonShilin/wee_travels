class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.references :tour_agent, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
