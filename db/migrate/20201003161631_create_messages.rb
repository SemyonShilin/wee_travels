class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, index: true, foreign_key: true
      t.references :owner, polymorphic: true, index: true
      t.text :body

      t.timestamps
    end
  end
end
