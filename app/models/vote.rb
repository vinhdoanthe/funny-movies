class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, uniqueness: { scope: :movie }
  validates :value, inclusion: { in: [-1, 1] }

  after_save :update_movie_vote_count
  after_destroy :update_movie_vote_count

  def can_be_deleted_by?(user)
    user == self.user
  end

  private

  def update_movie_vote_count
    movie.update_vote_count
  end
end
