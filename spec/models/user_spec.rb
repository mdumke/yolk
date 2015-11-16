require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:farms) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:power_animal) }
end

