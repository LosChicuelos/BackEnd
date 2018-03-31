require 'test_helper'

class AlliancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alliance = alliances(:one)
  end

  test "should get index" do
    get alliances_url, as: :json
    assert_response :success
  end

  test "should create alliance" do
    assert_difference('Alliance.count') do
      post alliances_url, params: { alliance: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show alliance" do
    get alliance_url(@alliance), as: :json
    assert_response :success
  end

  test "should update alliance" do
    patch alliance_url(@alliance), params: { alliance: {  } }, as: :json
    assert_response 200
  end

  test "should destroy alliance" do
    assert_difference('Alliance.count', -1) do
      delete alliance_url(@alliance), as: :json
    end

    assert_response 204
  end
end
