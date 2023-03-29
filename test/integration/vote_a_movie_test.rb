require "test_helper"

class VoteAMovieTest < ActionDispatch::IntegrationTest
  # test "vote a movie" do
  #   post sign_in_path, params: {
  #     username: 'testusername',
  #     password: 'testpassword'
  #   }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   get new_movie_url
  #   assert_response :success
  #   post movies_url, params: {
  #     movie: {
  #       link: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
  #     }
  #   }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success

  #   # Vote Up
  #   movie = Movie.last
  #   puts "Vote up: #{movie.count_vote_up}"
  #   assert_difference 'movie.count_vote_up', 1 do
  #     post votes_url, params: {
  #       movie_id: movie.id,
  #       value: 1
  #     }
  #   end
  #   puts "Vote up: #{movie.count_vote_up}"

  #   # Can not vote twice
  #   post votes_url, params: {
  #     movie_id: movie.id,
  #     value: 1
  #   }
  #   assert_response :unprocessable_entity

  #   # Unvote
  #   assert_difference 'movie.count_vote_up', -1 do
  #     delete vote_url, params: {
  #       movie_id: movie.id
  #     }
  #   end

  #   # Vote Down
  #   assert_difference 'movie.count_vote_down', 1 do
  #     post votes_url, params: {
  #       movie_id: movie.id,
  #       value: -1
  #     }
  #   end

  #   # Can not vote twice
  #   post votes_url, params: {
  #     movie_id: movie.id,
  #     value: -1
  #   }
  #   assert_response :unprocessable_entity

  #   # Unvote
  #   assert_difference 'movie.count_vote_down', -1 do
  #     delete vote_url, params: {
  #       movie_id: movie.id
  #     }
  #   end

  # end
end
