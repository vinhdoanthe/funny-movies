require "test_helper"

class ShareAMovieTest < ActionDispatch::IntegrationTest
  test "share a movie" do
    # User login
    # Then go to new movie page
    # Then share a movie
    # if successfully, user will be redirected to movies page
    # and the movie will be created
    #
    post sign_in_path, params: {
      username: 'testusername',
      password: 'testpassword'
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    get new_movie_url
    assert_response :success
    post movies_url, params: {
      movie: {
        link: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    movie = Movie.last
    assert_equal 'https://www.youtube.com/watch?v=9bZkp7q19f0', movie.link
    assert_equal 'testusername', movie.user.username

  end
end
