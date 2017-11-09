class Post < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  has_many :comments
  has_many :attachments

  def comments_by_time
    comments.order("created_at DESC")
  end
end
