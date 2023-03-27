class MoviesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if MoviesServices.create(@movie)
      flash[:success] = "Movie created successfully"
      redirect_to root_path
    else
      flash[:error] = "Movie could not be created ${movie.errors.full_messages}"
      render :new
    end
  end

  def index
    # TODO prefetch the user
    # TODO prefetch the votes
    @movies = Movie.all
  end

  private

  def movie_params
    params.require(:movie).permit(:link)
  end
end