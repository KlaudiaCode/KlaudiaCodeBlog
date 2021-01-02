class Article < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  scope :has_image, -> {joins(image_attachment: :blob)}

  validates :title, presence:true, length: {minimum: 6, maximum: 100}
  validates :description, presence:true, length: {minimum: 10, maximum: 1000}
end