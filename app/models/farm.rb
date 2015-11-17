class Farm < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, class_name: 'User'

  validates :name, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def self.recent
    limit(5).order('created_at desc')
  end

  def average_rating
    return 0 if reviews.empty?
    (reviews.map(&:rating).sum / reviews.count.to_f).round(1)
  end

  def recent_reviews
    reviews.order('created_at desc').limit(5)
  end
end

