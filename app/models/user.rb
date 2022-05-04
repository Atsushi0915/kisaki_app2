class User < ApplicationRecord
  has_secure_password
  has_one_attached :icon_image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :icon_image, presence: true

  has_many :posts
  has_many :comments
end
