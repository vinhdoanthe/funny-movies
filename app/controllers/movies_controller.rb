class MoviesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user! , only: [:new, :create]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if MoviesServices.create(@movie)
      flash[:success] = "Movie created successfully"
      redirect_to movies_path
    else
      flash.now[:danger] = "Movie could not be created #{@movie.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    # TODO prefetch the votes
    @pagy, @movies = pagy(Movie.includes(:user).order(created_at: :desc))
  end

  private

  def movie_params
    params.require(:movie).permit(:link)
  end
end
