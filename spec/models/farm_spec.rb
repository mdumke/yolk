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

  describe '.reviewed' do
    it 'returns only the farms that have at least one review' do
      farm1 = create(:farm, reviews: [create(:review)])
      farm2 = create(:farm)
      expect(Farm.reviewed.to_a).to eq([farm1])
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

  describe '#recent_reviews' do
    let(:farm) { create(:farm) }

    it 'returns an empty array if there is no recent review' do
      expect(farm.recent_reviews).to eq []
    end

    it 'returns the last reviews ordered by descenting creation date' do
      review1 = create(:review, farm: farm, created_at: 2.days.ago)
      review2 = create(:review, farm: farm)
      expect(farm.recent_reviews).to eq([review2, review1])
    end

    it 'returns only the last 5 reviews' do
      6.times { create(:review, farm: farm) }
      expect(farm.recent_reviews.count).to eq(5)
    end
  end
end

