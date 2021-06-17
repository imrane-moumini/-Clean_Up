class AddPriceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :users, :user_price, currency: { present: false }
  end
end
