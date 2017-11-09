class Venue < ApplicationRecord
  validates_presence_of :name,
  validates :street_number, :street, :city, :zip_code

  enum status: [:active, :retired]
end
