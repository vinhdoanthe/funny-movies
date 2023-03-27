class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, uniqueness: { scope: :movie }
  validates :value, inclusion: { in: [-1, 1] }
end
