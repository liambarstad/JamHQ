class Attachment < ApplicationRecord
  validates_presence_of :body, :extension
  belongs_to :post
end
