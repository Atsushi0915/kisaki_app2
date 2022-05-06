class Post < ApplicationRecor
  before_validation :set_nameless_title

  validates :title, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 300}
  validates :user_id, presence: true
  validates :post_image, presence: true

  belongs_to :user
  has_many :comments

  private
    def set_nameless_title
      self.title = "No Title" if title.blank?
    end
end
