class VotesServices

  def vote(vote_params, current_user)
    vote = Vote.new(vote_params)
    vote.user = current_user
    vote.save
  end

end
