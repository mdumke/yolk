require 'spec_helper'

describe Review do
  it { is_expected.to belong_to(:farm) }
  it { is_expected.to belong_to(:reviewer) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_presence_of(:body) }

  describe '.featured' do
    it 'returns a single random review' do
      2.times { create(:review) }
      expect(Review.all).to include(Review.featured)
    end
  end
end

