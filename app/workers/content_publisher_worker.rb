class ContentPublisherWorker
  include Sidekiq::Worker

  def perform(content_id)
    content = Content.find_by(id: content_id, status: :draft)
    content.update(status: :published, published_date: Time.now) if content.present?
  end
end
