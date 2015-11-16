require 'spec_helper'

describe Farm, type: :model do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:reviewers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }
end

