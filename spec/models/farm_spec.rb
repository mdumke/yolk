require 'spec_helper'

describe Farm do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:reviewers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }

  describe '.recent' do
    it 'returns an empty array if there are no farms' do
      expect(Farm.recent).to eq []
    end

    it 'returns the farms ordered by latest first' do
      farm1 = create(:farm, created_at: 1.day.ago)
      farm2 = create(:farm, created_at: Time.current)
      expect(Farm.recent).to eq [farm2, farm1]
    end

    it 'returns only the last five farms' do
      6.times { create(:farm) }
      expect(Farm.recent.count).to eq 5
    end
  end

  describe '#average_rating' do
    let(:farm) { build(:farm) }

    it 'returns 0 if a farm has no ratings' do
      expect(farm.average_rating).to eq(0)
    end

    it 'returns the correct average up to 1 decimal place' do
      [2, 2, 3].each { |rating| create(:review, rating: rating, farm: farm) }
      expect(farm.average_rating).to eq(2.3)
    end
  end
end

