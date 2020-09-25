class CreateTourAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_agents do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
