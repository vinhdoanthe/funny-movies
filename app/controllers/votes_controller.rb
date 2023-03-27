class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_vote, only: [:destroy]

  def create
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:movie_id)
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
end
