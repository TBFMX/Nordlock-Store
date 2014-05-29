require 'test_helper'

class ReviewCartControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sender" do
    get :sender
    assert_response :success
  end

end
