class Farm < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, class_name: 'User'

  validates :name, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def average_rating
    return 0 if reviews.empty?
    (reviews.map(&:rating).sum / reviews.count.to_f).round(1)
  end
end

