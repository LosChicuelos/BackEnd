require 'test_helper'

class ClasificacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clasificaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get clasificaciones_create_url
    assert_response :success
  end

  test "should get update" do
    get clasificaciones_update_url
    assert_response :success
  end

  test "should get edit" do
    get clasificaciones_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get clasificaciones_destroy_url
    assert_response :success
  end

  test "should get index" do
    get clasificaciones_index_url
    assert_response :success
  end

end
