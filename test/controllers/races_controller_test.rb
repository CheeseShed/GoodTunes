require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  setup do
    @race = races(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:races)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post :create, race: { date: @race.date, description: @race.description, mainImage: @race.mainImage, name: @race.name, playlist_id: @race.playlist_id, route_id: @race.route_id, secondImage: @race.secondImage, target: @race.target, thirdImage: @race.thirdImage, user_id: @race.user_id }
    end

    assert_redirected_to race_path(assigns(:race))
  end

  test "should show race" do
    get :show, id: @race
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race
    assert_response :success
  end

  test "should update race" do
    patch :update, id: @race, race: { date: @race.date, description: @race.description, mainImage: @race.mainImage, name: @race.name, playlist_id: @race.playlist_id, route_id: @race.route_id, secondImage: @race.secondImage, target: @race.target, thirdImage: @race.thirdImage, user_id: @race.user_id }
    assert_redirected_to race_path(assigns(:race))
  end

  test "should destroy race" do
    assert_difference('Race.count', -1) do
      delete :destroy, id: @race
    end

    assert_redirected_to races_path
  end
end
