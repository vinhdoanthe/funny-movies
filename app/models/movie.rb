class Movie < ApplicationRecord
  belongs_to :user
  has_many :votes

  attribute :count_vote_up, :integer, default: 0
  attribute :count_vote_down, :integer, default: 0

  validates :link, presence: true

  def update_vote_count
    self.count_vote_up = votes.where(value: 1).count
    self.count_vote_down = votes.where(value: -1).count
    save
  end

end
