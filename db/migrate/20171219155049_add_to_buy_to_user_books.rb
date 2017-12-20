class AddToBuyToUserBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :user_books, :to_buy, :boolean
  end
end
