class AddProfileInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :facebook_id, :bigint
  end
end
