module VotesHelper

  VOTE_UP_VALUE = 1
  VOTE_DOWN_VALUE = -1

  def user_vote?(movie)
    current_user.votes.where(movie_id: movie.id).exists?
  end

  def user_vote_up?(movie)
    current_user.votes.where(movie_id: movie.id, value: 1).exists?
  end

  def user_vote_down?(movie)
    current_user.votes.where(movie_id: movie.id, value: -1).exists?
  end
end
