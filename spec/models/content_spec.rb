require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'validations' do
    before { FactoryBot.build(:content) }

    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(255).on(:create) }
    it { should validate_presence_of(:author) }
    it { should validate_length_of(:author).is_at_most(40).on(:create) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(50).on(:create) }
    it { should validate_length_of(:content).is_at_most(1000).on(:create) }
    it { should define_enum_for(:status).with_values([:draft, :published]) }
  end

  context 'class methods' do
    describe '.published' do
      before do
        FactoryBot.create(:content, status: :published, summary: 'Hello World!')
        FactoryBot.create(:content, status: :draft)
      end

      it 'returns published content only' do
        expect(Content.published).not_to be_empty
        expect(Content.published.count).to eq 1
        expect(Content.published.first.summary).to eq 'Hello World!'
      end
    end
  end
end
