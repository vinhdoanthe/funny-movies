class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_vote, only: [:destroy]

  def create
    if VotesServices.vote(vote_params, current_user)
      @movie = Movie.find(vote_params[:movie_id])
      respond_to do |format|
        format.turbo_stream
        format.html do
          flash[:success] = "Vote created successfully"
          redirect_to movies_path
        end
      end
    else
      respond_to do
        format.html do
          flash.now[:danger] = "Vote could not be created"
          redirect_to movies_path, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    if @vote&.can_be_deleted_by?(current_user)
      @movie = @vote.movie
      if @vote.destroy
        respond_to do |format|
          format.turbo_stream
          format.html do
            flash[:success] = "Unvote successfully"
            redirect_to movies_path
          end
        end
      else
        respond_to do |format|
          format.html do
            flash.now[:danger] = "Unvote could not be performed"
            redirect_to movies_path, status: :unprocessable_entity
          end
        end
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:danger] = "You can only unvote your own votes"
          redirect_to movies_path, status: :unprocessable_entity
        end
      end
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
