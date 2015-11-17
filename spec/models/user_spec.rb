require 'spec_helper'

describe User do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:farms) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:power_animal) }

  describe '#full_name' do
    it 'returns the concatenation of first and last name' do
      alice = build(:user, first_name: 'Alice', last_name: 'Malice')
      expect(alice.full_name).to eq 'Alice Malice'
    end
  end
end

