require 'test_helper'

class FlatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flat" do
    assert_difference('Flat.count') do
      post :create, :flat => { }
    end

    assert_redirected_to flat_path(assigns(:flat))
  end

  test "should show flat" do
    get :show, :id => flats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flats(:one).to_param
    assert_response :success
  end

  test "should update flat" do
    put :update, :id => flats(:one).to_param, :flat => { }
    assert_redirected_to flat_path(assigns(:flat))
  end

  test "should destroy flat" do
    assert_difference('flat.count', -1) do
      delete :destroy, :id => flats(:one).to_param
    end

    assert_redirected_to flats_path
  end
end
