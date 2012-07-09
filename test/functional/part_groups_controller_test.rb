require 'test_helper'

class PartGroupsControllerTest < ActionController::TestCase
  setup do
    @part_group = part_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_group" do
    assert_difference('PartGroup.count') do
      post :create, part_group: { name: @part_group.name }
    end

    assert_redirected_to part_group_path(assigns(:part_group))
  end

  test "should show part_group" do
    get :show, id: @part_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_group
    assert_response :success
  end

  test "should update part_group" do
    put :update, id: @part_group, part_group: { name: @part_group.name }
    assert_redirected_to part_group_path(assigns(:part_group))
  end

  test "should destroy part_group" do
    assert_difference('PartGroup.count', -1) do
      delete :destroy, id: @part_group
    end

    assert_redirected_to part_groups_path
  end
end
