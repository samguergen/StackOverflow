class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :name
      t.integer :age
      t.string :avatar

      t.timestamps null: false
    end
  end
end
