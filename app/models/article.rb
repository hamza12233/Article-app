class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  validates :user_id, presence: true

  def self.article_search(search)
    where(title: search).first
  end


end
