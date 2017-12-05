class CreateToBuyLists < ActiveRecord::Migration[5.1]
  def change
    create_table :to_buy_lists do |t|
      t.string :book_title
      t.string :author
      t.string :cover_photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
