class CreateCommunications < ActiveRecord::Migration[6.0]
  def change
    create_table :communications do |t|
      t.belongs_to :conversation, index: true, foreign_key: true
      t.belongs_to :message, index: true, foreign_key: true
      t.references :user, polymorphic: true, index: true

      t.timestamps
    end
  end
end
