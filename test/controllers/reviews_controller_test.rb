require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get reviews_url
    assert_response :redirect
  end

  test "should get new" do
    get new_review_url
    assert_response :redirect
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, review: { comment: @review.comment, personalscore: @review.personalscore, project_id: @review.project_id, written_by_id: @review.written_by_id, written_for_id: @review.written_for_id, workscore: @review.workscore } 
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_review_url(@review)
    assert_response :redirect
  end

  test "should update review" do
    patch review_url(@review)
    assert_response :redirect
  end

  # test "should destroy review" do
  #   assert_difference('Review.count', -1) do
  #     delete review_url(@review)
  #   end

  #   assert_redirected_to reviews_url
  # end
end
