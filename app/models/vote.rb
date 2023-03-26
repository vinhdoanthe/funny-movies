class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :user, uniqueness: { scope: :video }
  validates :value, inclusion: { in: [-1, 1] }
end
