class User < ApplicationRecord
  has_many :surveys

  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

  normalizes :email, with: -> email { email.downcase }
end
