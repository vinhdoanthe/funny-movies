class MoviesServices
  def self.create(movie)
    # Use YouTube API to get video information
    # Then create a new movie with the information
    # Then save the movie into the database
    #

    # Validate the link
    movie.validate
    if movie.errors[:link].present?
      return false
    end

    begin
      video = VideoInfo.new(movie.link)
    rescue VideoInfo::UrlError
      movie.errors.add(:link, "is not a valid YouTube link")

      return false
    end

    if video.available? && video.provider == 'YouTube'
      movie.title = video.title
      movie.description = video.description
      movie.embed_code = video.embed_code
      movie.save

      true
    else
      movie.errors.add(:link, "is not a valid YouTube link")

      false
    end
  end
end
