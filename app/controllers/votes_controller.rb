class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_vote, only: [:destroy]

  def create
    # TODO check if the user has already voted for this movie

    if VotesServices.vote(vote_params, current_user)
      # TODO render js
      flash[:success] = "Vote created successfully"
      redirect_to movies_path
    else
      # TODO render js
      flash.now[:danger] = "Vote could not be created"
      redirect_to movies_path, status: :unprocessable_entity
    end
  end

  def destroy
    if @vote&.can_be_deleted_by?(current_user)
      if @vote.destroy
        # TODO render js
        flash[:success] = "Unvote successfully"
        redirect_to movies_path
      else
        # TODO render js
        flash.now[:danger] = "Unvote could not be performed"
        redirect_to movies_path, status: :unprocessable_entity
      end
    else
      # TODO render js
      flash.now[:danger] = "You can only unvote your own votes"
      redirect_to movies_path, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.permit(:movie_id, :value)
  end

  def set_vote
    @vote = Vote.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    puts @vote
  end

end
