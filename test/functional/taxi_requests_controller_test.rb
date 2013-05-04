require 'test_helper'

class TaxiRequestsControllerTest < ActionController::TestCase
  setup do
    @taxi_request = taxi_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxi_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxi_request" do
    assert_difference('TaxiRequest.count') do
      post :create, taxi_request: { driver_id: @taxi_request.driver_id, pickup_location: @taxi_request.pickup_location, pickup_time: @taxi_request.pickup_time, status: @taxi_request.status, user_id: @taxi_request.user_id }
    end

    assert_redirected_to taxi_request_path(assigns(:taxi_request))
  end

  test "should show taxi_request" do
    get :show, id: @taxi_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taxi_request
    assert_response :success
  end

  test "should update taxi_request" do
    put :update, id: @taxi_request, taxi_request: { driver_id: @taxi_request.driver_id, pickup_location: @taxi_request.pickup_location, pickup_time: @taxi_request.pickup_time, status: @taxi_request.status, user_id: @taxi_request.user_id }
    assert_redirected_to taxi_request_path(assigns(:taxi_request))
  end

  test "should destroy taxi_request" do
    assert_difference('TaxiRequest.count', -1) do
      delete :destroy, id: @taxi_request
    end

    assert_redirected_to taxi_requests_path
  end
end
