require 'spec_helper'

describe Farm, type: :model do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:reviewers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }

  describe '#average_rating' do
    it 'returns 0 if a farm has no ratings' do
      farm = build(:farm)
      expect(farm.average_rating).to eq(0)
    end

    it 'returns the correct average up to 1 decimal place' do
      farm = build(:farm)
      [2, 2, 3].each { |rating| create(:review, rating: rating, farm: farm) }
      expect(farm.average_rating).to eq(2.3)
    end
  end
end

