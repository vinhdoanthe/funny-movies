class MoviesServices
  def self.create(movie)
    video = VideoInfo.new(movie.link)

    if video.available? && video.provider == 'YouTube'
      movie.title = video.title
      movie.description = video.description
      movie.embed_code = video.embed_code
      movie.save
    else
      movie.errors.add(:link, "is not a valid YouTube link")
    end
  end
end
