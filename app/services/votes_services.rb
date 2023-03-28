class VotesServices

  def self.vote(vote_params, current_user)
    # Check if the user has already voted for this movie
    if Vote.where(movie_id: vote_params[:movie_id], user_id: current_user.id).exists?
      return false
    else
      vote = Vote.new(vote_params)
      vote.user = current_user
      vote.save
    end
  end

end
