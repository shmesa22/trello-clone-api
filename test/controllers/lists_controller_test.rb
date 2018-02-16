# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = List.last
    @board = @list.board
  end

  test 'get index: is successful' do
    get api_v1_board_lists_path(locale: 'es', board_id: @board)
    assert_response :success
  end

  test 'post create: creates a list' do
    assert_difference 'List.count', 1 do
      post api_v1_board_lists_path(locale: 'es', board_id: @board), params: { list: { title: 'new board' } }
      assert_response :success

      assert_equal 'new board', List.last.title
    end
  end

  test 'put update: edits a list' do
    assert_difference 'List.count', 0 do
      put api_v1_board_list_path(locale: 'es', board_id: @board, id: @list), params: { list: { title: 'edited list' } }
      assert_response :success

      assert_equal 'edited list', List.last.title
    end
  end

  test 'patch update: edits a list' do
    assert_difference 'List.count', 0 do
      put api_v1_board_list_path(locale: 'es', board_id: @board, id: @list), params: { list: { title: 'edited list' } }
      assert_response :success

      assert_equal 'edited list', List.last.title
    end
  end

  test 'delete destroy: destroys a list' do
    assert_difference 'List.count', -1 do
      delete api_v1_board_list_path(locale: 'es', board_id: @board, id: @list)
      assert_response :success
    end
  end
end
