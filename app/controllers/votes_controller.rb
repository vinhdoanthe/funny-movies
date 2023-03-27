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
  end

  private

  def vote_params
    params.require(:vote).permit(:movie_id, :value)
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
end
