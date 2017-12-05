class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :first_name
      t.string :last_name
      t.string :grade_level
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
