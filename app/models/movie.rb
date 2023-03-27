class Movie < ApplicationRecord
  belongs_to :user

  attribute :count_vote_up, :integer, default: 0
  attribute :count_vote_down, :integer, default: 0

  validates :link, presence: true
end
