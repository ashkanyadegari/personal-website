class Article < ApplicationRecord
  has_many_attached :photos
  has_rich_text :rich_body
  validates :photos, presence: true
  validates :title, presence: true
  validates :rich_body, presence: true
end
