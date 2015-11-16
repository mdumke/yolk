class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :reviews
  has_many :farms, through: :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :power_animal, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end

