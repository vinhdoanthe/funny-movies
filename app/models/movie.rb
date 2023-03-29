class Movie < ApplicationRecord
  belongs_to :user
  has_many :votes

  attribute :count_vote_up, :integer, default: 0
  attribute :count_vote_down, :integer, default: 0

  validates :link, presence: true
  validates :count_vote_up, :comparison => { greater_than_or_equal_to: 0 }
  validates :count_vote_down, :comparison => { greater_than_or_equal_to: 0 }

  def update_vote_count
    # This method should be divided into two methods
    # update_vote_up_count
    # update_vote_down_count
    # and use plus, minus operator to update the count, no necesary to make query to database
    self.count_vote_up = votes.where(value: 1).count
    self.count_vote_down = votes.where(value: -1).count
    save
  end

end
