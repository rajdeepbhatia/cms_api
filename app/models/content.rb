class Content < ApplicationRecord
  enum status: [ :draft, :published ]
  DEFAULT_LIMIT = 10

  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { in: 50..1000 }

  after_create :publish_content

  def publish_content
    if draft?
      ContentPublisherWorker.perform_in(1.day, id)
    end
  end
end
