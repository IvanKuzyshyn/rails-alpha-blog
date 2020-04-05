class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "should be valid" }
  validates :email, uniqueness: true

  has_secure_password
end
