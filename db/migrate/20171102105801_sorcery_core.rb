class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.integer :role, default: 0

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
