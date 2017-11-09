class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true
      t.text :body

      t.timestamps
    end
  end
end