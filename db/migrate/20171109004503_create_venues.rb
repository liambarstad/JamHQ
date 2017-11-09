class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_number
      t.string :street
      t.string :city
      t.integer :zip_code
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
