# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = Board.last
  end

  test 'get index: is successful' do
    get api_v1_boards_path
    assert_response :success
  end

  test 'get show: is successful' do
    get api_v1_board_path(locale: 'es', id: @board)
    assert_response :success
  end

  test 'post create: creates a board' do
    assert_difference 'Board.count', 1 do
      post api_v1_boards_path, params: { board: { title: 'new board', description: 'new description' } }
      assert_response :success

      assert_equal 'new board', Board.last.title
      assert_equal 'new description', Board.last.description
    end
  end

  test 'put update: edits a board title' do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es', id: @board), params: { board: { title: 'edited board title' } }
      assert_response :success

      assert_equal 'edited board title', Board.last.title
    end
  end

  test 'put update: edits a board description' do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es', id: @board), params: { board: { description: 'edited board description' } }
      assert_response :success

      assert_equal 'edited board description', Board.last.description
    end
  end

  test 'patch update: edits a board title' do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es', id: @board), params: { board: { title: 'edited board title' } }
      assert_response :success

      assert_equal 'edited board title', Board.last.title
    end
  end

  test 'patch update: edits a board description' do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es', id: @board), params: { board: { description: 'edited board description' } }
      assert_response :success

      assert_equal 'edited board description', Board.last.description
    end
  end

  test 'delete destroy: destroys a board' do
    assert_difference 'Board.count', -1 do
      delete api_v1_board_path(locale: 'es', id: @board)
      assert_response :success
    end
  end
end
