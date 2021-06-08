class AddCleanerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cleaner, :boolean
  end
end
