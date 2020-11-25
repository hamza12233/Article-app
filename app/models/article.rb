class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  validates :user_id, presence: true




  scope :status_published, -> { where(is_published: true) }



end
