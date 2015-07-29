require 'test_helper'

class GetflowsControllerTest < ActionController::TestCase
  setup do
    @getflow = getflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:getflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create getflow" do
    assert_difference('Getflow.count') do
      post :create, getflow: { completed: @getflow.completed, name: @getflow.name, title: @getflow.title }
    end

    assert_redirected_to getflow_path(assigns(:getflow))
  end

  test "should show getflow" do
    get :show, id: @getflow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @getflow
    assert_response :success
  end

  test "should update getflow" do
    patch :update, id: @getflow, getflow: { completed: @getflow.completed, name: @getflow.name, title: @getflow.title }
    assert_redirected_to getflow_path(assigns(:getflow))
  end

  test "should destroy getflow" do
    assert_difference('Getflow.count', -1) do
      delete :destroy, id: @getflow
    end

    assert_redirected_to getflows_path
  end
end
