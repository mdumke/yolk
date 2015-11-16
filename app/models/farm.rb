class Farm < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, class_name: 'User'

  validates :name, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
end

