class CreateUserBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_books do |t|
      t.string :book_title
      t.string :cover_photo
      t.string :author
      t.string :description
      t.string :tags
      t.string :rating
      t.boolean :has_read
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
