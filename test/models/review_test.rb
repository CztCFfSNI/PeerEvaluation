require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = Review.new(personalscore: 10, workscore: 10, comment: "String")
  end

  test "should be valid" do
    assert_not @review.valid?
  end

  test "personalscore should be present" do
    @review.personalscore = ""
    assert_not @review.valid?
  end

  test "workscore should be present" do
    @review.workscore = ""
    assert_not @review.valid?
  end

  test "comment should be present" do
    @review.comment = ""
    assert_not @review.valid?
  end

  test "comment should not be too long" do
    @review.comment = "a" * 800
    assert_not @review.valid?
  end

  test "personalscore should not negative" do
    @review.personalscore = -1
    assert_not @review.valid?
  end

  test "workscore should not negative" do
    @review.workscore = -1
    assert_not @review.valid?
  end




end
