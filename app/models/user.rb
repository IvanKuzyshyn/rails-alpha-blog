class User < ApplicationRecord
  has_many :comments
  has_many :articles

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "should be valid" }
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
