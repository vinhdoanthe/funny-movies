require "test_helper"

class VoteTest < ActiveSupport::TestCase

  def setup
    @vote1 = votes(:one)
    @vote2 = votes(:two)
  end

  test "vote should be valid" do
    assert @vote1.valid?
    assert @vote2.valid?
  end

  test "user should be present" do
    @vote1.user = nil
    assert_not @vote1.valid?
  end

  test "movie should be present" do
    @vote1.movie = nil
    assert_not @vote1.valid?
  end

  test "A user can only vote once per movie" do
    @vote2.user = @vote1.user
    @vote2.movie = @vote1.movie
    assert_not @vote2.valid?
  end

  test "Only owner of vote can unvote" do
    assert_not @vote2.can_be_deleted_by?(users(:one))
  end

end
