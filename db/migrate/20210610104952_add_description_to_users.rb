class AddDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text
    add_column :users, :number_of_reviews, :integer
    add_column :users, :user_price, :integer
  end
end
