require "test_helper"

class MovieTest < ActiveSupport::TestCase

  def setup
    @movie = movies(:one)
  end

  test "first movie should be valid" do
    assert @movie.valid?
  end

  test "link should be present" do
    @movie.link = " "
    assert_not @movie.valid?
  end

  test "user should be present" do
    @movie.user = nil
    assert_not @movie.valid?
  end

  test "count vote up should not be negavite" do
    @movie.count_vote_up = -1
    assert_not @movie.valid?
  end

  test "count vote down should not be negavite" do
    @movie.count_vote_down = -1
    assert_not @movie.valid?
  end

end
