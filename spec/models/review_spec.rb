require 'spec_helper'

describe Review, type: :model do
  it { is_expected.to belong_to(:farm) }
  it { is_expected.to belong_to(:reviewer) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_presence_of(:body) }
end

