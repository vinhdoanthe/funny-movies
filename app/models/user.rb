class User < ApplicationRecord
  has_secure_password

  has_many :votes

  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\Z/,
                                                                                                        message: "only allows letters" }

  validates :password, presence: true, length: { minimum: 5}, format: { without: /\s/, message: "does not allow blank" }
end
