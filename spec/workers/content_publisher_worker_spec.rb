require 'rails_helper'
RSpec.describe ContentPublisherWorker, type: :worker do
  it { is_expected.to be_processed_in :default }

  it 'should enqueue a sidekiq job to update status when initial status is draft' do
    content = FactoryBot.create(:content, status: :draft)
    expect(ContentPublisherWorker).to have_enqueued_sidekiq_job(content.id).in(1.day)
  end

  it 'should not trigger the after create callback when status is published' do
    content = FactoryBot.create(:content, status: :published)
    expect(ContentPublisherWorker).not_to have_enqueued_sidekiq_job(content.id).in(1.day)
  end
end
