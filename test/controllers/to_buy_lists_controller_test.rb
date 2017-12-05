require 'test_helper'

class ToBuyListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @to_buy_list = to_buy_lists(:one)
  end

  test "should get index" do
    get to_buy_lists_url, as: :json
    assert_response :success
  end

  test "should create to_buy_list" do
    assert_difference('ToBuyList.count') do
      post to_buy_lists_url, params: { to_buy_list: { author: @to_buy_list.author, book_title: @to_buy_list.book_title, cover_photo: @to_buy_list.cover_photo, user_id: @to_buy_list.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show to_buy_list" do
    get to_buy_list_url(@to_buy_list), as: :json
    assert_response :success
  end

  test "should update to_buy_list" do
    patch to_buy_list_url(@to_buy_list), params: { to_buy_list: { author: @to_buy_list.author, book_title: @to_buy_list.book_title, cover_photo: @to_buy_list.cover_photo, user_id: @to_buy_list.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy to_buy_list" do
    assert_difference('ToBuyList.count', -1) do
      delete to_buy_list_url(@to_buy_list), as: :json
    end

    assert_response 204
  end
end
