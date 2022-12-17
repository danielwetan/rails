class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 200, null: false
      t.string :full_name, limit: 255, null: false
      t.string :email, limit: 150, null: false
      t.string :password, limit: 255, null: false
      t.string :role, limit: 20, default: 'user', null: false
      t.timestamps
    end
  end
end 
