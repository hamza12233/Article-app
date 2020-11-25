class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  validates :user_id, presence: true  

<<<<<<< HEAD


  scope :status_published, -> { where(is_published: true) }
=======
  # def self.article_search(search)
  #     where(title: search).first
  # end
>>>>>>> 7fdb0a4a20792b267914d5c69a870b229b111030

end
