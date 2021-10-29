require 'test_helper'

class SkatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get skates_index_url
    assert_response :success
  end

  test "should get show" do
    get skates_show_url
    assert_response :success
  end

  test "should get new" do
    get skates_new_url
    assert_response :success
  end

  test "should get create" do
    get skates_create_url
    assert_response :success
  end

  test "should get update" do
    get skates_update_url
    assert_response :success
  end

  test "should get edit" do
    get skates_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get skates_destroy_url
    assert_response :success
  end

end
