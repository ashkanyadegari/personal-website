class Article < ApplicationRecord
  has_many_attached :photos
  has_rich_text :rich_body
  validates :photos, presence: true
  validates :title, presence: true
  validates :rich_body, presence: true
  acts_as_taggable_on :tags

  include PgSearch::Model
  pg_search_scope :search_by_title_and_body,
    against: [ :title, :content ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
