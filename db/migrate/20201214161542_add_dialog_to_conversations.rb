class AddDialogToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :dialog, :boolean, null: false, default: true
  end
end
