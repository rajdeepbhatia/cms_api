class Content < ApplicationRecord
  enum status: [ :draft, :published ]

  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { in: 50..1000 }
end
