class Review < ActiveRecord::Base
  belongs_to :farm
  belongs_to :reviewer, foreign_key: 'user_id', class_name: 'User'

  validates :body, presence: true
  validates :rating,
    presence: true,
    numericality: {only: :integer, greater_than: 0, less_than: 6}
end

